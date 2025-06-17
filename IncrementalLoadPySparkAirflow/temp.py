import requests
import json
# Base URL

URL = "https://www.nseindia.com/api/equity-stockIndices?index=NIFTY%2050"

# Headers to mimic a browser
headers = {
    "User-Agent": "Mozilla/5.0",
    "Accept-Language": "en-US,en;q=0.9",
    "Accept-Encoding": "gzip, deflate, br",
    "Referer": "https://www.nseindia.com/",
    "Connection": "keep-alive"
}

# Start a session to handle cookies
session = requests.Session()
session.headers.update(headers)

# Make a request to the home page first to get cookies
session.get("https://www.nseindia.com", timeout=5)

# Now request the API
response = session.get(URL, timeout=10)

# Check response
print(response.status_code)
