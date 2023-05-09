# Set base image to Python 3.8
FROM python:3.8

# Set environment variable for OpenAI API key
ENV OPENAI_API_KEY=<insert_api_key_here>

# Copy source code to working directory
COPY . /app

# Set working directory
WORKDIR /app

# Install required dependencies from requirements.txt
RUN pip install -r requirements.txt

# Expose port 5000
EXPOSE 5000

# Run the application
CMD ["python", "openai-chat.py"]

