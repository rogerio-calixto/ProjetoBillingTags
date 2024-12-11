aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 365857435132.dkr.ecr.us-east-1.amazonaws.com
docker build -t img_fargate:v2 .
docker tag img_fargate:v2 365857435132.dkr.ecr.us-east-1.amazonaws.com/projetobillingtags:img_fargate_v2
docker push 365857435132.dkr.ecr.us-east-1.amazonaws.com/projetobillingtags:img_fargate_v2