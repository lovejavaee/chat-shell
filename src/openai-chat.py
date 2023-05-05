import os
import requests
import json

"""
Sends a message to the OpenAI API using the GPT-3.5 Turbo model and returns a response message.

:param input: A string containing the message to send to the API.
:return: A string containing the response message from the API.
"""


def send_message(input):
    endpoint = "https://api.openai.com/v1/chat/completions"
    if not "OPENAI_API_KEY" in os.environ:
        print("Error: OPENAI_API_KEY is not set.")
        return None
    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {os.environ['OPENAI_API_KEY']}"
    }
    data = {
        "model": "gpt-3.5-turbo",
        "messages": [{"role": "user", "content": input}]
    }
    resp = requests.post(endpoint, headers=headers, data=json.dumps(data))

    # Check response status code
    if resp.status_code != 200:
        print(f"Error: Request failed with status code {resp.status_code}")
        return None

    message = resp.json()["choices"][0]["message"]["content"]
    if not message:
        print("Error: No response from GPT-3.5 Turbo model.")
        return None
    return message


print("Chat with ChatGPT. Type 'q' to quit.")
CHAT_HISTORY = []
while True:
    input_message = input("Me>: ")
    if input_message == "q":
        break
    response = send_message(input_message)
    if response:
        CHAT_HISTORY.append(input_message)
        CHAT_HISTORY.append(response)
        print(f"ChatGPT>: {response}")
