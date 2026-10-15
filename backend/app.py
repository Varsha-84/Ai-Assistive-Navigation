from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({
        "message": "AI Assistive Navigation System API Running"
    })

@app.route('/health')
def health():
    return jsonify({
        "status": "success",
        "server": "running"
    })

if __name__ == '__main__':
    app.run(debug=True)