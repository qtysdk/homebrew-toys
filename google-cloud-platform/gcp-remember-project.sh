#!/bin/bash

# 檢查 jq 是否安裝
check_command() {
    if ! command -v $1 &> /dev/null; then
        echo "錯誤: $1 未安裝。請安裝 $1 後再運行此腳本。"
        exit 1
    fi
}

check_command jq

# 設定原始認證檔案的路徑
CREDENTIALS_PATH="$HOME/.config/gcloud/application_default_credentials.json"

# 檢查認證檔案是否存在
if [ ! -f "$CREDENTIALS_PATH" ]; then
    echo "錯誤: 認證檔案不存在: $CREDENTIALS_PATH"
    exit 1
fi

# 從 JSON 文件讀取 quota_project_id
PROJECT_ID=$(jq -r '.quota_project_id // empty' "$CREDENTIALS_PATH")

# 檢查是否成功讀取到 project_id
if [ -z "$PROJECT_ID" ]; then
    echo "錯誤: 無法讀取 quota_project_id，或 quota_project_id 為空"
    exit 1
fi

# 指定新檔案的存儲目錄和路徑
TARGET_DIR="$HOME/.config/gcloud/my_accounts"
TARGET_PATH="$TARGET_DIR/${PROJECT_ID}.json"

# 創建目標目錄如果它不存在
mkdir -p "$TARGET_DIR"

# 複製認證檔案到新位置
if cp "$CREDENTIALS_PATH" "$TARGET_PATH"; then
    echo "成功: 已將認證檔案複製到 $TARGET_PATH"
else
    echo "錯誤: 複製認證檔案失敗"
    exit 1
fi

echo "腳本執行完成"
