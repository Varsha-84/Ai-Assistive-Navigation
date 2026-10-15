import easyocr

reader = easyocr.Reader(['en'])

def read_text(image_path):
    result = reader.readtext(image_path)

    extracted_text = []

    for detection in result:
        extracted_text.append(detection[1])

    return extracted_text