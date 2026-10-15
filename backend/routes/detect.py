from flask import Blueprint, request, jsonify
from models.object_detector import detect_objects

detect_bp = Blueprint('detect', __name__)

@detect_bp.route('/detect', methods=['POST'])
def detect():
    image_path = request.json.get("image_path")

    objects = detect_objects(image_path)

    return jsonify({
        "detected_objects": objects
    })