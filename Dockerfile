# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Install Python and Tesseract OCR dependencies
RUN apt-get update \
    && apt-get install -y tesseract-ocr libtesseract-dev \
    && pip install --no-cache-dir pytesseract Pillow Flask

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Run app.py when the container launches
CMD ["python", "./app.py"]