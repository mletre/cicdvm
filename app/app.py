from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    """
    Main endpoint for the application, returns a greeting.
    """
    return "Hello Testing CICD using VM"

@app.route("/healthz")
def healthz():
    """
    Health check endpoint.
    Returns a 200 OK status to indicate the application is running.
    """
    return "OK", 200 # Return "OK" and an HTTP 200 status code

if __name__ == "__main__":
    # When running locally, the application will be accessible at http://127.0.0.1:8080/
    # In Cloud Run, the port 8080 is automatically exposed.
    app.run(host="0.0.0.0", port=8080)
