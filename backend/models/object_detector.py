from ultralytics import YOLO

# Load model only once
model = YOLO("yolov8n.pt")

def detect_objects(image_path):
    results = model(image_path)

    detected = []

    for result in results:
        for box in result.boxes:
            class_id = int(box.cls[0])
            class_name = model.names[class_id]

            if class_name not in detected:
                detected.append(class_name)

    return detected