# ---- root/main.tf

module "vpc" {
  source   = "./vpc"
  vpc_cidr = "10.1.0.0/16"
  ext_ip   = "50.46.129.237/32" #"0.0.0.0/0"
  pb_cidrs = ["10.1.1.0/24", "10.1.2.0/24"]
}

# resource "aws_key_pair" "cicd_gitlab" {
#   key_name   = "cicdgitlab"
#   public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGrQc0rBu9L33kAXscDTBwm9PIrfxnMl+fDIKrtUCnTb edwardpius@Edwards-MBP-2.fios-router.home"
# }

module "ec2" {
  source = "./ec2"
  kp_pb_sg  = module.vpc.kp_pb_sg
  kp_pb_sn  = module.vpc.kp_pb_sn
  key    = "neo4jtest" #aws_key_pair.cicd_gitlab.key_name #"neo4jtest"
  #pt_sg  = module.vpc.pt_sg
  #pt_sn  = module.vpc.pt_sn
  #alb_tg = module.lb.alb_tg
}