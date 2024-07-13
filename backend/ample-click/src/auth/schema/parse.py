import PyPDF2

# Open the PDF file
file_path = "/home/family/Downloads/Community-Pharmacy-Dec.202021.pdf"
pdf_file = open(file_path, "rb")  # Use "rb" mode to read binary file

# Create a PDF reader object
pdf_reader = PyPDF2.PdfReader(pdf_file)

# Initialize a variable to store the text
pdf_text = ""

# Loop through all the pages and extract text
for page_num in range(len(pdf_reader.pages)):
    page = pdf_reader.pages[page_num]
    pdf_text += page.extract_text()

# Close the PDF file
pdf_file.close()




# Regular expression pattern to match medicine names
pattern = re.compile(r"([A-Za-z0-9/\+\s]+) +\.+\s+\d+")

# Find all matches

# # Open a text file for writing
# output_file = open("/home/family/Documents/A2SV-Internal-Hackathon/A2SV-Internal-Hackathon/backend/ample-click/src/auth/schema/ooutput.txt", "w")

# # Write the output to the text file
# output_file.write(pdf_text[-89500:])

# # Close the text file
# output_file.close()



