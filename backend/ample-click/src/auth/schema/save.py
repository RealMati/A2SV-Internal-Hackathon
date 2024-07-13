# import re

# # Read the content of the file
# with open("/home/family/Documents/A2SV-Internal-Hackathon/A2SV-Internal-Hackathon/backend/ample-click/src/auth/schema/output.txt", "r") as file:
#     text = file.read()

# # Regular expression pattern to match medicine names before the dots
# pattern = re.compile(r"([A-Za-z0-9/\+\(\)\s]+) +\.+\s+\d+")

# # Find all matches
# medicines = pattern.findall(text)

# # Open a text file for writing
# with open("/home/family/Documents/A2SV-Internal-Hackathon/A2SV-Internal-Hackathon/backend/ample-click/src/auth/schema/output2.txt", "w") as output_file:
#     for medicine in medicines:
#         output_file.write(medicine.strip() + "\n")

# with open("/home/family/Documents/A2SV-Internal-Hackathon/A2SV-Internal-Hackathon/backend/ample-click/src/auth/schema/output2.txt", "r") as file:
#     text2 = file.read()

# def process_text(text):
#     lines = text.split('\n')
#     processed_lines = []
    
#     i = 0
#     while i < len(lines):
#         line = lines[i].strip()
        
#         # If the line is a number, skip it
#         if line.isdigit():
#             i += 1
#             continue
        
#         # If the line ends with a plus sign, incorporate the next line
#         while line.endswith('+') or line.endswith('+ '):
#             i += 1
#             if i < len(lines):
#                 next_line = lines[i].strip()
#                 line = line.rstrip('+') + ' ' + next_line
        
#         processed_lines.append(line)
#         i += 1
    
#     return '\n'.join(processed_lines)


# with open("/home/family/Documents/A2SV-Internal-Hackathon/A2SV-Internal-Hackathon/backend/ample-click/src/auth/schema/output222.txt", "r") as file:
#     text2 = file.read()

# def pr2(text):
#     lines = text.split('\n')
#     processed_lines = []
    
#     i = 0
#     while i < len(lines):
#         line = lines[i].strip()

#         if line=='':
#             # print(lines[89].split(" "))
#             # print(i)
#             i+=1
#             continue
            
#         l=line.split(' ')
#         alldig=False
#         for j in l:
#             if j.isdigit():
#                 alldig= alldig or True
#             else:
#                 alldig= alldig or False
#                 break
#         if alldig:
#             # print(i)
#             i+=1
#             continue
        
#         processed_lines.append(line)
#         i += 1
    
#     return '\n'.join(processed_lines)

# out=pr2(text2)
# with open("/home/family/Documents/A2SV-Internal-Hackathon/A2SV-Internal-Hackathon/backend/ample-click/src/auth/schema/output3.txt", "w") as file:
#     file.write(out)



with open("/home/family/Documents/A2SV-Internal-Hackathon/A2SV-Internal-Hackathon/backend/ample-click/src/auth/schema/output3.txt", "r") as file:
    text3 = file.read()


def pr4(text):

    t=text.split('\n')
    ct=0
    for i in t:
        if len(i)==1:
            ct+=1
            print(i)

    print(ct)
    arr=[]
    i=0
    a=0
    bucket=[]
    while i<len(t):
        if len(t[i])==1:
            arr.append(bucket)
            bucket=[]
            i+=1
        else:
            bucket.append(t[i])
            i+=1

    alph=["A","B","C","D","E","F","G","H","I","K",'L',"M","N","O","P","Q","R",'S',"T","U","V","W","X","Z"]
    m={}
    r=arr[1:]+[[t[-1]]]
    for i in range(len(r)):
        m[alph[i]]=r[i]
    return m
res=str(pr4(text3))

with open("/home/family/Documents/A2SV-Internal-Hackathon/A2SV-Internal-Hackathon/backend/ample-click/src/auth/schema/List_Of Medicines.txt", "w") as file:
    file.write(res)