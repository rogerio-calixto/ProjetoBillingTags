docker build -t img_fargate:v1 .
docker tag img_fargate:v1 365857435132.dkr.ecr.us-east-1.amazonaws.com/projetobillingtags:img_fargate_v1
docker push 365857435132.dkr.ecr.us-east-1.amazonaws.com/projetobillingtags:img_fargate_v1