#!/bin/bash

# Set up the API endpoint and authentication headers
endpoint="https://api.openai.com/v1/chat/completions"
if [[ -z "${OPENAI_API_KEY}" ]]; then
    echo "Error: OPENAI_API_KEY is not set."
    exit 1
fi
headers=(
    "Content-Type: application/json"
    "Authorization: Bearer $OPENAI_API_KEY"
)

# Define a function to send a message to the GPT-3.5 Turbo model
send_message() {
    local input="$1"
    local data='{
        "model": "gpt-3.5-turbo",
        "messages": [{"role": "user", "content": "'"${input}"'"}]
    }'
    local resp=$(curl -s -H "${headers[0]}" -H "${headers[1]}" -d "${data}" "${endpoint}")
    # Checks whether the variable "message" is empty or not
    local message=($(echo "${resp}" | jq -r '.choices[].message.content'))
    if [[ -z "${message}" ]]; then
        printf "Error: No response from GPT-3.5 Turbo model.\n"
        return 1
    fi
    printf "%s" "${message}"
}

# Start the chat loop
echo "Chat with ChatGPT. Type 'q' to quit."
while true; do
    read -p "Me>: " input
    if [[ "${input}" == "q" ]]; then
        break
    fi
    response=$(send_message "${input}")
    printf "ChatGPT>: %s\n" "${response}"
done

# Previous chat history
CHAT_HISTORY=()

while true; do
    # Read user input with readline
    read -e chat_message
    
    # Add message to chat history
    CHAT_HISTORY+=("$chat_message")
    
    # If user presses ctrl+n, go to next message in history
    if [[ "$chat_message" == $'\C-n' ]]; then
        if (( ${#CHAT_HISTORY[@]} > 0 )); then
            # Remove last message from history (current message)
            unset 'CHAT_HISTORY[${#CHAT_HISTORY[@]}-1]'
            # Print next message from history
            echo "${CHAT_HISTORY[${#CHAT_HISTORY[@]}-1]}"
        fi
        continue
    fi
    
    # If user presses ctrl+p, go to previous message in history
    if [[ "$chat_message" == $'\C-p' ]]; then
        if (( ${#CHAT_HISTORY[@]} > 1 )); then
            # Remove last message from history (current message)
            unset 'CHAT_HISTORY[${#CHAT_HISTORY[@]}-1]'
            # Print previous message from history
            echo "${CHAT_HISTORY[${#CHAT_HISTORY[@]}-1]}"
        fi
        continue
    fi
    
    # Otherwise, display the message
    echo "You said: $chat_message"
done
