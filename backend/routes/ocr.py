from flask import Blueprint, request, jsonify
from models.text_reader import read_text

ocr_bp = Blueprint("ocr", __name__)

@ocr_bp.route("/ocr", methods=["POST"])
def ocr():

    data = request.get_json()

    image_path = data["image_path"]

    text = read_text(image_path)

    return jsonify({
        "text": text
    })