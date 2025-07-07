🧱 Frontend (Next.js)
📍 URL: http://localhost:3000
This is your UI where users can input a URL to generate a QR code.

🐍 Backend (FastAPI)
📍 Base URL:http://localhost:8000
📍 API Endpoint for generating QR code:

POST http://localhost:8000/generate-qr/?url=https://example.com
You can test this endpoint using:

The frontend UI (when wired correctly)

curl from the terminal:

curl -X POST "http://localhost:8000/generate-qr/?url=https://example.com"
✅ If successful, you'll get a response like:

{
"qr_code_url": "https://<your-bucket-name>.s3.amazonaws.com/qr_codes/example.com.png"
}
