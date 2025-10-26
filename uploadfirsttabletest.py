import firebase_admin
from firebase_admin import credentials, firestore
import pandas as pd
import time

# === Step 1: Initialize Firebase ===
cred = credentials.Certificate(
    r"C:\Filo Work\Mobile Projects\egtema3elegtema3el3am\egtema3-el3am-firebase-adminsdk-fbsvc-a18745c778.json"
)
firebase_admin.initialize_app(cred)
db = firestore.client()

# === Step 2: Delete old collection safely ===
def delete_collection(collection_ref, batch_size=500):
    docs = collection_ref.limit(batch_size).stream()
    deleted = 0
    for doc in docs:
        print(f"🗑️ Deleting doc: {doc.id}")
        doc.reference.delete()
        deleted += 1

    if deleted >= batch_size:
        time.sleep(1)
        return delete_collection(collection_ref, batch_size)

print("🚨 Deleting old 'attendance' collection...")
delete_collection(db.collection("attendance"))
print("✅ Old collection deleted successfully!\n")

# === Step 3: Load Excel data ===
data = pd.read_excel(r"C:\Users\filof\Documents\attendance.xlsx")

# === Step 4: Upload new data ===
collection_name = "attendance"
for index, row in data.iterrows():
    student_name = str(row.get("الأسم (ثلاثى وباللغة العربية)"))
    doc_id = student_name.strip()
    db.collection(collection_name).document(doc_id).set(row.to_dict())
    print(f"✅ Uploaded: {doc_id}")

print("\n🎉 All data uploaded successfully to Firestore!")
