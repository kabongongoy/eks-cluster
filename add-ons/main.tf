
module "kubernetes_addons" {
  source      = "./modules/kubernetes_addons"
  cluster_name = aws_eks_cluster.eks.name
  addons      = ["cluster_autoscaler"]


  roles = {
    "cluster_autoscaler" = {
      assume_role_actions = ["sts:AssumeRole", "sts:TagSession"]
    }
  }
  
  policies = {
    "cluster_autoscaler" = {
      statements = [
        {
          Effect   = "Allow"
          Action   = ["autoscaling:DescribeAutoScalingGroups", "autoscaling:SetDesiredCapacity"]
          Resource = ["*"]
        }
      ]
    }
  }

  role_policy_attachments = {
    "ca_attachment" = { role = "cluster_autoscaler", policy = "cluster_autoscaler" }
  }

  pod_identity_associations = {
    "cluster_autoscaler" = {
      namespace       = "kube-system"
      service_account = "cluster-autoscaler"
      role            = "cluster_autoscaler"
    }
  }

  helm_releases = {
    "autoscaler" = {
      repository  = "https://kubernetes.github.io/autoscaler"
      chart       = "cluster-autoscaler"
      namespace   = "kube-system"
      version     = "9.37.0"
      set_values  = [
        { name = "rbac.serviceAccount.name", value = "cluster-autoscaler" },
        { name = "autoDiscovery.clusterName", value = aws_eks_cluster.eks.name },
        { name = "awsRegion", value = "us-east-1" }
      ]
      depends_on = []
    }
  }
}
