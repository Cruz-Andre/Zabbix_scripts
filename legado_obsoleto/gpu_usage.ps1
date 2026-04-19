# Caminho do nvidia-smi
$smipath = "C:\Windows\System32\nvidia-smi.exe"

# Executa o comando e pega somente a primeira GPU
$output = & "$smipath" --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>$null

# Remove espaços e mostra o número
if ($output) {
    $usage = $output.Trim() -replace '[^0-9]', ''
    Write-Output $usage
} else {
    Write-Output "0"
}
