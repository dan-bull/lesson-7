# Проєкт ArgoCD + MLflow (Local Simulation)

### 1. Запуск інфраструктури
- `minikube start`
- `cd terraform/argocd && terraform init && terraform apply`

### 2. Доступ до ArgoCD
- URL: http://localhost:8080
- Login: admin
- Password: `kubectl -n infra-tools get secret argocd-initial-admin-secret...`

### 3. Перевірка деплою
- `kubectl get pods -n ml-project`
- MLflow доступний через `kubectl port-forward` на порті 5000.