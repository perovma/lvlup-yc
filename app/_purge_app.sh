kubectl delete -f deployment.yaml
kubectl delete -f service.yaml
kubectl delete -f ingress.yaml
kubectl delete -f acme-issuer.yaml
kubectl delete -f certbot.yaml

#kubectl delete svc certbot
#kubectl delete svc app

#kubectl delete ingress tls-bot-ingress
#kubectl delete ingress minimal-ingress
