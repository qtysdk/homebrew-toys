#!/bin/bash

# 檢查必要的工具是否安裝
check_command() {
    if ! command -v $1 &> /dev/null; then
        echo "錯誤: $1 未安裝。請安裝 $1 後再運行此腳本。"
        exit 1
    fi
}

check_command fzf
check_command jq

# 設定 GCP 帳戶配置目錄
CONFIG_DIR="$HOME/.config/gcloud/my_accounts"
# 設定 application_default_credentials.json 的路徑
DEFAULT_CREDS_PATH="$HOME/.config/gcloud/application_default_credentials.json"

# 使用 find 命令找到所有 .json 檔案,並使用 fzf 讓使用者選擇
selected_project=$(find "$CONFIG_DIR" -name "*.json" -exec basename {} .json \; | fzf --prompt="請選擇一個 GCP 專案: ")

# 檢查是否有選擇專案
if [ -n "$selected_project" ]; then
    echo "您選擇了: $selected_project"
    
    # 複製選中的 JSON 檔案到 application_default_credentials.json
    source_json="$CONFIG_DIR/$selected_project.json"
    if [ -f "$source_json" ]; then
        cp "$source_json" "$DEFAULT_CREDS_PATH"
        echo "已將 $source_json 複製到 $DEFAULT_CREDS_PATH"
        
        # 檔案複製成功後,設置當前專案
        gcloud config set project "$selected_project"
        echo "已將 $selected_project 設為當前專案"
    else
        echo "錯誤: 找不到 $source_json 檔案"
        echo "未能設定專案"
    fi
else
    echo "未選擇任何專案"
fi
