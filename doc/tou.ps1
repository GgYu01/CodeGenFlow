# 设置目标目录路径
$targetDirectory = "D:\CodeGenFlow\doc"

# 检查目录是否存在，如果不存在则创建
if (-not (Test-Path -Path $targetDirectory -PathType Container)) {
    Write-Host "目录 $targetDirectory 不存在，正在创建..."
    New-Item -Path $targetDirectory -ItemType Directory -Force | Out-Null
    Write-Host "目录已创建。"
} else {
    Write-Host "目录 $targetDirectory 已存在。"
}

# 使用 1 到 7 的数字循环创建文件
1..7 | ForEach-Object {
    # 构建完整的文件名
    $fileName = "now_prompt_3_$_.md"
    $filePath = Join-Path -Path $targetDirectory -ChildPath $fileName

    # 创建空文件，如果文件已存在则覆盖 (使用 -Force)
    # 如果不想覆盖，可以去掉 -Force，但如果文件已存在会报错
    New-Item -Path $filePath -ItemType File -Force | Out-Null

    # 输出提示信息（可选）
    Write-Host "已创建文件: $filePath"
}

Write-Host "所有文件创建完成。"