Write-Output "Kubeapps URL: http://127.0.0.1:8001"
$env:KubeappsPodName = $(kubectl get pods --namespace kubeapps -l "app=kubeapps" -o jsonpath="{.items[0].metadata.name}")
Write-Output $env:KubeappsPodName

$data =  $(kubectl get secret $(kubectl get serviceaccount admin-user -o jsonpath='{.secrets[].name}') -o jsonpath='{.data.token}')
$token = [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($data))

Write-Output "===BEGIN TOKEN==="
Write-Output $token
Write-Output "===END TOKEN==="

kubectl proxy