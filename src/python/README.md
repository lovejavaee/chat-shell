{
    "outcome": "Successfully rewrote hunk."
}
{
    "outcome": "Successfully rewrote hunk."
}
docker build -t my-app .
```

2. Run the Docker container:
```bash
docker run -e "OPENAI_API_KEY=<your-api-key>" my-app
```

When you run the container, the script will run inside the container and display the response message from the API. The script keeps track of the chat history, which is stored in the CHAT_HISTORY list.

Disclaimer:

This script is for educational purposes only and should not be used for any other purpose. The use of the OpenAI API is subject to the OpenAI API Terms of Service.

The script keeps track of the chat history, which is stored in the CHAT_HISTORY list.

To quit the script, type "q" and press Enter.

**Disclaimer** 

This script is for educational purposes only and should not be used for any other purpose. The use of the OpenAI API is subject to the OpenAI API Terms of Service.