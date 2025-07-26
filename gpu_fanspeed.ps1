# Caminho do nvidia-smi
$smipath = "C:\Windows\System32\nvidia-smi.exe"

# Executa o comando
$output = & "$smipath" --query-gpu=fan.speed --format=csv,noheader,nounits 2> $null

# Remove espaços e mostra o número
# if ($output) {
#     $fanspeed = $output.Trim() -replace '[^0-9]', ''
#     Write-Output $fanspeed
# } else {
#     Write-Output "0"
# }
# Mostra o resultado.
# A princípio não precisa de formatação.
Write-Output $output