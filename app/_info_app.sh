echo "kubectl get nodes -o wide"
kubectl get nodes -o wide
echo ""
echo "kubectl get pod -o wide"
kubectl get pod -o wide
echo ""
echo "kubectl get svc -o wide"
kubectl get svc -o wide
echo ""
echo "kubectl get svc --all-namespaces"
kubectl get svc --all-namespaces
echo ""
echo "kubectl get ingress"
kubectl get ingress
echo ""
echo "kubectl describe svc app"
kubectl describe svc app
