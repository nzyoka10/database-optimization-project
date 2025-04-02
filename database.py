# Define file paths for inspection
bank_full_csv_path = os.path.join(extract_dir, "bank", "bank-full.csv")
bank_names_txt_path = os.path.join(extract_dir, "bank", "bank-names.txt")

# Read the first few lines of the CSV file to check the structure
with open(bank_full_csv_path, "r", encoding="utf-8") as file:
    bank_full_preview = [next(file) for _ in range(5)]

# Read the contents of bank-names.txt if available
bank_names_content = None
if os.path.exists(bank_names_txt_path):
    with open(bank_names_txt_path, "r", encoding="utf-8") as file:
        bank_names_content = file.read()

bank_full_preview, bank_names_content[:500] if bank_names_content else "No column descriptions found."
