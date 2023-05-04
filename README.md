# Demo Project

This is a demo project showcasing how to use the OpenAI API with a bash script.

## Getting started

1. Obtain an OpenAI API key by following the instructions [here](https://beta.openai.com/docs/quickstart).
2. Clone this repository: `git clone https://github.com/<username>/demo-project.git`
3. Install `jq` if it's not already installed on your system.
4. Set the `OPENAI_API_KEY` environment variable to your API key: `export OPENAI_API_KEY=<your api key>`
5. Run the script: `./openai-chat.sh`

## Usage

1. The script will start a chat loop and prompt you to enter a message.
2. Type your message and press Enter to send it to the OpenAI API.
3. The script will receive a response from the API and display it in the terminal.
4. To exit the chat loop, type `q` and press Enter.

## Dependencies

- `curl` - command line tool for transferring data
- `jq` - command line JSON processor

## Contributing

If you find a bug or have an idea for a new feature, feel free to open an issue or submit a pull request!

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
