# # import re

# # # Read the content of the file
# # with open("/home/family/Documents/A2SV-Internal-Hackathon/A2SV-Internal-Hackathon/backend/ample-click/src/auth/schema/output.txt", "r") as file:
# #     text = file.read()

# # # Regular expression pattern to match medicine names before the dots
# # pattern = re.compile(r"([A-Za-z0-9/\+\(\)\s]+) +\.+\s+\d+")

# # # Find all matches
# # medicines = pattern.findall(text)

# # # Open a text file for writing
# # with open("/home/family/Documents/A2SV-Internal-Hackathon/A2SV-Internal-Hackathon/backend/ample-click/src/auth/schema/output2.txt", "w") as output_file:
# #     for medicine in medicines:
# #         output_file.write(medicine.strip() + "\n")

# # with open("/home/family/Documents/A2SV-Internal-Hackathon/A2SV-Internal-Hackathon/backend/ample-click/src/auth/schema/output2.txt", "r") as file:
# #     text2 = file.read()

# # def process_text(text):
# #     lines = text.split('\n')
# #     processed_lines = []
    
# #     i = 0
# #     while i < len(lines):
# #         line = lines[i].strip()
        
# #         # If the line is a number, skip it
# #         if line.isdigit():
# #             i += 1
# #             continue
        
# #         # If the line ends with a plus sign, incorporate the next line
# #         while line.endswith('+') or line.endswith('+ '):
# #             i += 1
# #             if i < len(lines):
# #                 next_line = lines[i].strip()
# #                 line = line.rstrip('+') + ' ' + next_line
        
# #         processed_lines.append(line)
# #         i += 1
    
# #     return '\n'.join(processed_lines)


# # with open("/home/family/Documents/A2SV-Internal-Hackathon/A2SV-Internal-Hackathon/backend/ample-click/src/auth/schema/output222.txt", "r") as file:
# #     text2 = file.read()

# # def pr2(text):
# #     lines = text.split('\n')
# #     processed_lines = []
    
# #     i = 0
# #     while i < len(lines):
# #         line = lines[i].strip()

# #         if line=='':
# #             # print(lines[89].split(" "))
# #             # print(i)
# #             i+=1
# #             continue
            
# #         l=line.split(' ')
# #         alldig=False
# #         for j in l:
# #             if j.isdigit():
# #                 alldig= alldig or True
# #             else:
# #                 alldig= alldig or False
# #                 break
# #         if alldig:
# #             # print(i)
# #             i+=1
# #             continue
        
# #         processed_lines.append(line)
# #         i += 1
    
# #     return '\n'.join(processed_lines)

# # out=pr2(text2)
# # with open("/home/family/Documents/A2SV-Internal-Hackathon/A2SV-Internal-Hackathon/backend/ample-click/src/auth/schema/output3.txt", "w") as file:
# #     file.write(out)



# with open("/home/family/Documents/A2SV-Internal-Hackathon/A2SV-Internal-Hackathon/backend/ample-click/src/auth/schema/output3.txt", "r") as file:
#     text3 = file.read()


# def pr4(text):

#     t=text.split('\n')
#     ct=0
#     for i in t:
#         if len(i)==1:
#             ct+=1
#             print(i)

#     print(ct)
#     arr=[]
#     i=0
#     a=0
#     bucket=[]
#     while i<len(t):
#         if len(t[i])==1:
#             arr.append(bucket)
#             bucket=[]
#             i+=1
#         else:
#             bucket.append(t[i])
#             i+=1

#     alph=["A","B","C","D","E","F","G","H","I","K",'L',"M","N","O","P","Q","R",'S',"T","U","V","W","X","Z"]
#     m={}
#     r=arr[1:]+[[t[-1]]]
#     for i in range(len(r)):
#         m[alph[i]]=r[i]
#     return m
# res=str(pr4(text3))

# with open("/home/family/Documents/A2SV-Internal-Hackathon/A2SV-Internal-Hackathon/backend/ample-click/src/auth/schema/List_Of Medicines.txt", "w") as file:
#     file.write(res)


dic={'A': ['Abiraterone', 'Absorbable gelatin sponge', 'Acamprosate', 'Acarbose', 'Aceclofenac', 'Acemetacin', 'Acetaminophen + Acetylsalicylic', 'Acetaminophen + Pseudoephedrine', 'Acetaminophen/Paracetamol', 'Acetaminophen/Paracetamol + Acetylsalicylic acid  Caffeine', 'Acetaminophen/Paracetamol + Caffeine', 'Acetaminophen/Paracetamol + Chlormezanone', 'Acetaminophen/Paracetamol + Diphenhydramine  Pseudoephedrine', 'Acetaminophen/Paracetamol + Orphenadrine Citrate', 'Acetaminophen/Paracetamol +Pseudoephedrine HCl  Chlorpheniramine', 'Acetazolamide', 'Acetic Acid', 'Acetylcholine Chloride', 'Acetylcysteine', 'Acetylsalicylic Acid', 'Acetylsalicylic Acid/Aspirin', 'Acitretin', 'Actinomycin–D (Dactinomycin)', 'Activated charcoal', 'Activated Charcoal', 'Acyclovir', 'Acyclovir (Aciclovir)', 'Adapalene', 'Adefovir dipivoxil', 'Adenosine', 'Adrenaline', 'Adrenaline (Epinephrine)', 'Ahmed Valve', 'Alcohol based hand rub', 'Alendronate', 'Alendronate Sodium', 'Alfacalcidol', 'Alfuzosin', 'Allopurinol', 'trans retinoid acid (ATRA)', 'Almotriptan', 'Alosetron', 'Alpha Beta Arteether', 'Alpha Chymotrypsin', 'Alprazolam', 'Alteplase', 'Aluminium Chloride', 'Aluminum Hydroxide', 'Aluminum Hydroxide + Magnesium Hydroxide', 'Aluminum Hydroxide + Magnesium Hydroxide  Simethicone', 'Aluminum Sulphate +Calcium Hypochlorite + Sodium Carbonate', 'Amantadine Hydrochloride', 'Ambroxol Hydrochloride', 'Amikacin', 'Amiloride', 'Aminacrine', 'Aminocaproic acid', 'Aminocaproic Acid', 'Aminolaevulinic acid', 'Aminophylline', 'Amiodarone', 'Amitriptyline', 'Amlodipine', 'Ammonium Chloride', 'Amoxicillin + Clavulanic Acid', 'Amoxicillin)', 'Amphotericin B', 'Ampicillin', 'Ampicillin Sodium + Sulbactam Sodium', 'Ampicillin Sodium+ Cloxacillin Sodium', 'Amrinone lactate', 'Amylmetacresol + Dichlorobenzyl Alcohol', 'Anagrelide', 'Anastrozole', 'Antazoline + Naphazoline', 'Anticoagulant Citrate (ACD Solution) Sodium Citrate  Citric Acid +Dextrose', 'Anti-Rho (D) Human immunoglobulin', 'Anti-Rho (D) Immune Globulin', 'Apixaban', 'Apomorphine Hydrochloride', 'Apraclonidine Hydrochloride', 'Aprepitant', 'Aquatabs', 'Arsenic trioxide', 'Artemether', 'Ascorbic Acid (Vitamin C)', 'Atenolol', 'Atomoxetine', 'Atorvastatin', 'Atovaquone', 'Atropine', 'Atropine Sulphate', 'Azacitidine', 'Azathioprine', 'Azelaic Acid', 'Azelastine HCl'], 'B': ['Baclofen', 'Baerveldts Valve', 'Balanced salt solution', 'Barium Sulfate', 'Beclomethasone Dipropinate', 'Beclomethasone Dipropionate', 'Bendamustine', 'Benoxinate Hydrochloride', 'Benzhexol (Trihexyphenidyl Hydrochloride)', 'Benzoic Acid + Salicylic Acid', 'Benzoyl Peroxide', 'Benztropine (Mesylate)', 'Benzyl Benzoate', 'Betahistine', 'Betamethasone', 'Betamethasone + Dexchlorpheniramine Maleate', 'Betamethasone Sodium Phosphate + Betamethasone Diprionate', 'Betamethasone valerate + Phenylephrine Hydrochloride  Lidocaine Hydrochloride', 'Betaxolol', 'Bevacizumab', 'Bicalutamide', 'Bimatoprost', 'Biphasic Insulin', 'Biphasic Isophane Insulin', 'Bisacodyl', 'Bismuth Oxide + Balsam Peru + Zinc Oxide + Bismuth Subgallate', 'Bismuth Subgallate Compound with Hydrocortisone', 'Bismuth Subsalicylate', 'Bisoprolol fumarate', 'Bisoprolol Fumarate + Amlodipine Besylate', 'Bisoprolo l Fumarate/ Hydrochlorothiazide', 'Bleomycin', 'Bortezomib', 'Bosentan', 'Botulism Antitoxin Polyvalent', 'Bretylium Tosylate', 'Brimonidine', 'Brinzolamide', 'Bromazepam', 'Bromfenac', 'Bromhexine Hydrochloride', 'Bromocriptine', 'Budesonide', 'Budesonide +Formoterol Fumarate', 'Bumetanide', 'Bupivacaine', 'Bupropion', 'Buspirone', 'Busulfan'], 'C': ['C3F8Gas', 'Cabergoline', 'Calamine', 'Calciferol (Ergocalciferol', 'Calcipotriol', 'Calcium', 'Calcium Carbonate', 'Calcium chloride', 'Calcium Folinate', 'Calcium Folinate (Leucovorin Calcium)', 'Calcium Glubionate + Calcium Galactogluconate', 'Calcium Gluconate', 'Calcium Hypochlorite + Iron Sulphate', 'Calcium Hypochlorite + Iron Sulphate + Bentonite  Potassium Permanganate Polyacrylamide + Sodium Carbonate', 'Calcium Lactate', 'Camphor', 'Candesartan', 'Capecitabine', 'Captopril', 'Carbamazepine', 'Carbamide Peroxide', 'Carbenicillin', 'Carbetocin', 'Carbimazole', 'Carbocisteine', 'Carboplatin', 'Carmustine', 'Carvedilol', 'Cascara sagrada', 'Caspofungin', 'Castor oil', 'Cefaclor', 'Cefadroxil', 'Cefditoren', 'Cefprozil', 'Ceftaroline', 'Celecoxib', 'Cephradine', 'Cetirizine', 'Cetuximab', 'Chloral Hydrate', 'Chlorambucil', 'Chloramphenicol', 'Chlordiazepoxide', 'Chlordiazepoxide + Clidinium Bromide', 'Chlorhexidine Gluconate', 'Chlorohexidine + Benzocaine', 'Chloroquine Phosphate', 'Chlorpheniramine Maleate', 'Chlorpheniramine M aleate + Phenylephrine Hydrochloride + Guaifenesin', 'Chlorpromazine Hydrochloride', 'Chlorpropamide', 'Chlorthalidone', 'Cholecalciferol (Vitamin D3)', 'Chorionic Gonadotrophin', 'Cilostazol', 'Cimetidine', 'Cinchocaine Hydrochloride', 'Cisatracurium', 'Cisplatin', 'Citalopram', 'Cladribine', 'Clioquinol', 'Clobetasol Propionate', 'Clomiphene Citrate', 'Clomipramine Hydrochloride', 'Clonazepam', 'Clonidine', 'Clopidogrel', 'Clotrimazole', 'Cloxacillin Benzathine', 'Cloxacillin Sodium', 'Clozapine', 'Coagulation factor IX', 'Coagulation factor VIII', 'Coal Tar', 'Cocaine Hydrochloride', 'Codeine Phosphate', 'Colchicine', 'Condom female', 'Condom male', 'Conjugated Estrogen', 'Covid 19 vaccine SARS-COV-2 vaccine', 'Cromoglycate Potassium', 'Crotamiton', 'Cyanocobalamin (VitaminB12)', 'Cyclopentolate Hydrochloride', 'Cyclophosphamide', 'Cyclosporine', 'Cyproheptadine Hydrochloride', 'Cyproterone Acetate', 'Cytosine Arabinoside'], 'D': ['Dabigatran', 'Dacarbazine', 'Dalteparin', 'Danazol', 'Dantrolene Sodium', 'Dapagliflozin + metformin hydrochloride', 'Daptomycin', 'Darbepoetin alfa', 'Darifenacin', 'Dasatinib', 'Daunomycin Hydrochloride', 'Deferasirox', 'Deferoxamine', 'Dehydroemetine', 'Denosumab', 'Dequalinium Chloride', 'Desloratadine', 'Desmopressin', 'Desmopressin acetate', 'Desoximethasone', 'Dexamethasone', 'Dexchlorpheniramine', 'Dexchlorpheniramine +Guaifenesin + Pseudoephedrine', 'Dexchlorpheniramine Maleate', 'Dextran', 'Dextroamphetamine', 'Dextromethorphan Hydrobromide', 'Dextrose/glucose', 'Diazepam', 'Diazoxide', 'Diclofenac + Methylsalicylate', 'Diclofenac Diethylamine', 'Diclofenac Dimethylamine', 'Diclofenac Potassium', 'Diclofenac Sodium', 'Diclofenac Sodium + Misoprostol', 'Dienestrol', 'Dienogest', 'Diethylcarbamazine', 'Dihydroartemisinin', 'Diloxanide Furoate', 'Diltiazem hydrochloride', 'Dimenhydrinate', 'Dimercaprol', 'Dimercaptosuccinic acid', 'Dinoprostone', 'Diphenhydramine + Sodium Citrate + Ammonium', 'Chloride', 'Diphenhydramine Hydrochloride', 'Diphenylhydantoin (Phenytoin)', 'Diphtheria antitoxin', 'Dipyridamole', 'Disulfiram', 'Dithranol', 'Dobutamine', 'Docetaxel', 'Docusate calcium', 'Domperidone', 'Dopamine', 'Dorzolamide', 'Doxazosin', 'Doxepin', 'Doxorubicin', 'Doxycycline', 'Doxylamine succinate', 'D-Penicillamine/ Penicillamine', 'Drospirenone', 'Drotaverine', 'Duloxetine', 'Dutasteride', 'Dydrogesterone'], 'E': ['Econazole', 'Edoxaban', 'Empagliflozin', 'Enalapril maleate', 'Enalaprilat', 'Enoxaparin', 'Entecavir', 'Ephedrine + Theophylline', 'Ephedrine sulphate', 'Ephedrine Sulphate', 'Epirubicin', 'Eplerenone', 'Epoetin Alfa', 'Epoetin Beta', 'Ergometrine Maleate', 'Ergotamine Tartrate', 'Ergotamine Tartrate + Caffeine Hydrate + Cyclizine', 'Hydrochloride', 'Ergotamine Tartrat e+ Caffeine', 'Ertapenem', 'Erythromycin', 'Erythropoietin', 'Escitalopram', 'Esmolol', 'Esomeprazole', 'Essential phospholipids', 'Estradiol', 'Estradiol + Estrol + Estrone', 'Estradiol valerate', 'Estradiol Valerate', 'Ethanolamine Oleate', 'Ethosuximide', 'Ethyl Alcohol/ethanol', 'Ethyl Chloride', 'Ethynodiol Diacetate', 'Etodolac', 'Etofenamet', 'Etonogestrel', 'Etonogestrel + Ethinyl estradiol', 'Etoposide', 'Etoricoxib', 'Etretinate', 'Express Tube', 'Ezetimibe'], 'F': ['Famciclovir', 'Famotidine', 'Felodipine', 'Fenofibrate', 'Fentanyl', 'Fexofenadine', 'Fibrinogen', 'Fidaxomicin', 'Filgrastim', 'Finasteride', 'Flecainide acetate', 'Flucinolone Acetonide', 'Flucloxacillin', 'Fluconazole', 'Flucortolone Pivalante', 'Flucytosine', 'Fludarabine', 'Fludrocortisone Acetate', 'Flumazenil', 'Fluocinonide', 'Fluocortolone', 'Fluorescein Sodium', 'Fluorouracil', 'Fluoxetine', 'Fluoxymesterone', 'Fluphenazine Decanoate', 'Fluphenazine Hydrochloride', 'Flurazepam Hydrochloride', 'Flurbiprofen', 'Flurometholone', 'Flutamide', 'Fluticasone +Salmeterol', 'Fluticasone Furoate', 'Fluvoxamine Maleate', 'Folic Acid', 'Folinic Acid', 'Fondaparinux', 'Formaldehyde', 'Formoterol Fumarate', 'Fosaprepitant', 'Foscarnet', 'Fosfomycin', 'Fosinopril', 'Fosphenytoin', 'Fusidic Acid'], 'G': ['Gabapentin', 'Gadobutrol', 'Gadodiamide', 'Gamabenzene Hexachloride', 'Gatifloxacin', 'Gatifloxcin', 'Gemcitabine', 'Gemfibrozil', 'Gemifloxacin', 'Gemtuzumab', 'Gentamycin', 'Gentian Violet', 'Glatiramer acetate', 'Glecaprevir + Pibrentasvir', 'Glibenclamide', 'Gliclazide', 'Glimepiride', 'Glipizide', 'Glucagon', 'Glutaraldehyde', 'Glycerin', 'Glycine', 'Glycolic', 'Goserelin Acetate', 'Granisetron Hydrochloride', 'Granisetrone Hydrochloride', 'Granulocyte colony stimulating factor', 'Griseofulvin', 'Guaifenesin'], 'H': ['Haemophilus Influenzae Type B', 'Haemophilus Influenzae Type B (Hib) Vaccine', 'Halazone', 'Haloperidol Decanoate', 'Heparin', 'Hepatitis B Vaccine Recombinant yeast DNA', 'inactivated', 'Hexadecyl Phosphocholine', 'Hexetidine', 'Hexidine', 'Homatropine Hydrobromide', 'Human Anti rabies Immunoglobulin', 'Human Papilloma Virus Vaccine', 'Hydralazine', 'Hydrochlorothiazide', 'Hydrocortisone', 'Hydrocortisone + Framycetin  Hydrocortisone Succinate', 'Hydrogen Peroxide', 'Hydroquinone', 'Hydroxy Chloroquine', 'Hydroxychloroquine', 'Hydroxyethyl Starch', 'Hydroxyprogesterone Caproate', 'Hydroxypropyl Methyl cellulose', 'Hydroxyurea', 'Hyoscine (Scopolamine) Hydrobromide', 'Hyoscine/Scopolamine Butyl bromide', 'Hyoscine/Scopolamine Hydrobromide'], 'I': ['Ibandronate', 'Ibuprofen', 'Ibuprofen + Pseudoephedrine Hydrochloride  Chlorpheniramine Maleate', 'Ichthammol', 'Idarubicin', 'Idoxuridine', 'Ifosfamide', 'Imatinib', 'Imipenem + Cilastatin', 'Imipramine', 'Imiquimod', 'Immune Serum Globulin Human', 'Indomethacin', 'Infliximab', 'Insulin Lispro', 'Insulin lispro/Insulin protamine', 'Insulin Soluble/Neutral', 'Insulin Zinc Suspension', 'Interferon Alpha', '1a subcutaneous', 'Interferon Gamma', 'Iodine', 'Iodized Salt', 'Iohexol', 'Iopamidol', 'Ipecac', 'Ipratropium Bromide', 'Irbesartan', 'Irinotecan Hydrochloride', 'Iron Complex', 'Iron Sucrose', 'Isoconazole', 'Isophane/NPH Insulin', 'Isoplasma', 'Isoprenaline Sulphate', 'Isoproterenol', 'Isosorbide', 'Isotretinoin/Tretinion', 'Isradipine', 'Itraconazole', 'Ivabradine', 'Ivermectin'], 'K': ['Ketoconazole', 'Ketorolac', 'Ketotifen'], 'L': ['Labetalol Hydrochloride', 'Lacosamide', 'Lactated Potassium Saline', 'Lactated Ringer’s', 'Lactic acid', 'Lactulose', 'Lamotrigine', 'Lansoprazole', 'asparginase', 'Latanoprost', 'Leflunomide', 'Lenalidomide', 'Letrozole', 'Leuprolide', 'Levobunolol', 'Levocabastine', 'Levocetirizine', 'Levodopa', 'Levodopa + Benserazide', 'Levodopa + Carbidopa', 'Levonorgestrel', 'Levonorgestrel + Ethinyl estradiol', 'Lidocaine', 'Lidocaine + Tribenoside', 'Lidocaine Hydrochloride', 'Linaclotide', 'Linagliptin', 'Lipid emulsion', 'Liquid Nitrogen', 'Liquid Paraffin', 'Lisinopril', 'Lisseman Green', 'Lithium Carbonate', 'Lodoxamide Tromethamine', 'Lomustine', 'Loperamide', 'Loratadine', 'Lorazepam', 'Losartan', 'Loteprednol', 'Lovastatin', 'Lubiprostone', 'Lumefantrine', 'Lynestrenol'], 'M': ['Magnesium Chloride', 'Magnesium citrate', 'Magnesium Citrate', 'Magnesium oxide', 'Magnesium sulphate', 'Magnesium Sulphate', 'Malathion', 'Mannitol', 'Mebendazole', 'Mebeverine', 'Mechlorethamine HCl', 'Meclizine Hydrochloride', 'Meclizine Hydrochloride+ Pyridoxine hydrochloride', 'Mecobalamin (Methyl Cobalamin)', 'Medazepam', 'Medroxyprogesterone Acetate', 'Mefenamic acid', 'Mefloquine Hydrochloride', 'Meglumine Antimoniate', 'Melarsonyl Potassium', 'Melarsoprol', 'Meloxicam', 'Melphalan', 'Menadiol  Sodium  Diphosphate', 'Menfegol', 'Menthol', 'Mercaptopurine', 'Mesalamine', 'Mesalazine', 'Mesna', 'Mesterolone', 'Metformin', 'Methadone Hydrochloride', 'Methionine', 'Methocarbamol', 'Methotrexate', 'Methoxsalen', 'Methyl Cellulose', 'Methyl Predinosolone +Aceponate', 'Methyldopa', 'Methylergometrine Maleate', 'Methylphenidate', 'Methylprednisolone', 'Methylsalicylate', 'Metoclopramide Hydrochloride', 'Metolazone', 'Metoprolol', 'Metoprolol succinate', 'Metrifonate', 'Mexiletine Hydrochloride', 'Mezlocillin', 'Miconazole', 'Midazolam', 'Midazolam Hydrochloride', 'Mifepristone', 'Mifeprostone', 'Milrinone', 'Miltefosine', 'Minocycline Hydrochloride', 'Minoxidil', 'Misoprostol', 'Mitomycin', 'Molteno Valve', 'Mometasone furoate', 'Mometasone Furoate', 'Monobenzone', 'Montelukast', 'Morphine Hydrochloride', 'Morphine Sulphate', 'Moxifloxacin', 'Multivitamins', 'Mupirocin', 'Mycophenolic Acid'], 'N': ['Naficillin', 'Nalidixic Acid', 'Naloxone Hydrochloride', 'Naltrexone', 'Naltrexone Hydrochloride', 'Naproxen', 'Naproxen Sodium', 'Natamycin', 'Nebivolol', 'Nedocromil Sodium', 'Neomycin', 'Nesiritide', 'Niacin (Vitamin B 3)', 'Nicardipine', 'Niclosamide', 'Nicotinamide', 'Nicotine Replacement Therapy (NRT)', 'Nicotinic Acid (Vit B 3)', 'Nifedipine', 'Nilotinib', 'Nimesulide', 'Nimodipine', 'Nitazoxanide', 'Nitrofurazone', 'Nitroglycerine', 'Nizatidine', 'Nonoxynol', 'Noradrenaline', 'Norethisterone', 'Norgestrel', 'Nortriptyline', 'Nystatin'], 'O': ['Octoxinol', 'Octreotide', 'Ofloxacin', 'Olanzapine', 'Olopatadine', 'fatty acid', 'Omeprazole', 'Omeprazole + Sodium Bicarbonate', 'Ondansetron', 'Ondansetrone', 'Oral Rehydration Salt', 'Orlistat', 'Ornidazole', 'Orphenadrine Citrate', 'Orphenadrine Hydrochloride', 'Oseltamivir Phosphate', 'Oxacillin', 'Oxaliplatin', 'Oxamniquine', 'Oxazepam', 'Oxidized Cellulose', 'Oxybutynin', 'Oxymetazoline Hydrochloride', 'Oxymetholone', 'Oxytetracycline', 'Oxytetracycline Hydrochloride', 'Oxytocin'], 'P': ['Paclitaxel', 'Palonosetron Hydrochloride', 'Pancreatin', 'Pancrelipase', 'Pancuronium', 'Panitumumab', 'Pantoprazole', 'Paracetamol/Acetaminophen', 'Paraffin Guaze Dressing', 'Paraldehyde', 'Paromomycin', 'Paroxetine', 'Pegfilgrastim', 'Penicillin G Benzathine', 'Penicillin G Sodium Crystalline', 'Penicillin V (Phenoxymethyl Penicillin)', 'Penicillin VK (Phenoxymethyl Penicillin Potassium)', 'Penirolols Potassium', 'Pentamidine Isethionate', 'Pentazocine', 'Pentobarbitone', 'Pentosalen', 'Perfluorocarbon liquids', 'Permethrin', 'Pethidine', 'Phenazopyridine Hydrochloride', 'Pheniramine', 'Phenobarbitone (Phenobarbital)', 'Phenoxybenzamine Hydrochloride', 'Phentolamine Mesylate', 'Phenylephrine', 'Phenytoin sodium (Diphenylhydantoin)', 'Pholcodine', 'Physostigmine Salicylate', 'Phytomenadione', 'Phytomenadione (Vitamin K1)', 'Phytomenadione (VitaminK1)', 'Pilocarpine', 'Pilocarpine Hydrochloride', 'Pimecrolimus', 'Pimozide', 'Pinaverium', 'Pioglitazone', 'Piperacillin', 'Piperacillin + Tazobactam', 'Piperaquine Phosphate', 'Piperazine', 'Piroxicam', 'Plasma Antihaemophilic', 'Podofilox', 'Polyethylene Glycol (PEG)', 'Polymyxin B +Bacitracin', 'Polyvinyl Chloride', 'Posaconazole', 'Potassium Bicarbonate', 'Potassium Chloride', 'Potassium Iodide', 'Potassium Permanganate', 'Povidone Iodine', 'Pralidoxime Chloride', 'Prasugrel', 'Praziquantel', 'Prazosin Hydrochloride', 'Prednisolone', 'Primaquine', 'Primaquine Phosphate', 'Primidone', 'Probenecid', 'Procainamide Hydrochloride', 'Procaine Hydrochloride', 'Procaine Penicillin', 'Procaine Penicillin Fortified', 'Procarbazine', 'Procyclidine', 'Progesterone', 'Proguanil', 'Promethazine', 'Promethazine Hydrochloride', 'Propantheline Bromide', 'Proparacaine Hydrochloride', 'Propofol', 'Propranolol', 'Propylthiouracil', 'Protamine sulphate', 'Protamine Sulphate', 'Psyllium', 'Pyrantel Pamoate', 'Pyridoxine', 'Pyridoxine Hydrochloride (Vitamin B6)', 'Pyrimethamine'], 'Q': ['Quetiapine', 'Quinidine sulphate', 'Quinupristin + Delfopristin'], 'R': ['Rabeprazole sodium', 'Rabies Antiserum', 'Raloxifene Hydrochloride', 'Ramipril', 'Ranibizumab', 'Ranitidine', 'Ranolazine', 'Rapamycin', 'Recombinant human factor IX', 'Recombinant human factor VIII', 'Reserpine', 'Reteplase', 'Retinoic Acid (Tretinoin)', 'Ribavirin', 'Riboflavin (Vit B 2)', 'Rifamycin', "Ringer's Solution", 'Risperidone', 'Ritodrine Hydrochloride', 'Rituximab', 'Rivaroxaban', 'Rocuronium Bromide', 'Rose Bengal', 'Rosiglitazone Maleate', 'Rosuvastatin'], 'S': ['Saccharin', 'Sacubitril + Valsatran', 'Salbutamol', 'Salbutamol (Albuterol)', 'Salbutamol + Bromhexine', 'Salbutamol + Bromhexine Hydrochloride + Guaifenesin  Menthol', 'Salicylic Acid', 'Saline Spray/solution', 'Saxagliptin', 'Scorpion Venon Antisera', 'Secnidazole', 'Selenium Sulphide', 'Senna', 'Sertaconazole Nitrate', 'Sertraline Hydrochloride', 'Serum Gonadotrophin', 'Sevelamer Hydrochloride', 'Sildenafil citrate', 'Silicon Oil', 'Silicone Gel', 'Silver Nitrate', 'Silver Sulphadiazine', 'Simethicone', 'Simethicone + Algerines citrate', 'Simvastatin', 'Sitagliptin', 'Snake Venom   Antiserum Polyvalent', 'Snake Venom Antiserum Polyvalent', 'Sodium Bicarbonate', 'Sodium Chloride', 'Sodium Chloride Free Salt', 'Sodium Chromoglycate', 'Sodium Cromoglycate', 'Sodium Dichloroisocyanurate', 'Sodium Hyaluronate', 'Sodium Morrhuate', 'Sodium Nitrite', 'Sodium nitroprusside', 'Sodium Polystyrene Sulphonate', 'Sodium Stibogluconate', 'Sodium Tetradecyl Sulphate', 'Sodium Thiosulphate', 'Sodium valproate', 'Sodium Valproate', 'Sodium/ Deithanolamine Fusidate', 'Sofosbuvir + Daclatasvir', 'Sofosbuvir + Ledipasvir', 'Sofosbuvir + Velpatasvir', 'Sorafenib', 'Sotalol', 'Sparfloxacin', 'Spectinomycin', 'Spiramycin', 'Spironolactone', 'Streptokinase', 'Sucralfate', 'Sulfacetamide Sodium', 'Sulfadiazine', 'Sulfadiazine + sulfamethazine + sulfamerazine', '(trisulfapyramidine)', 'Sulfadoxine + Pyrimethamine', 'Sulfasalazine', 'Sulphasalazine', 'Sulphur', 'Sultamicillin', 'Sumatriptan', 'Sunitinib', 'Sunscreen', 'Supportive hepatic preparation that contains essential', 'phospholipids and vitamins', 'Suprofen', 'Suramin Sodium', 'Synthetic Tissue Graft'], 'T': ['Tacrolimus', 'Tadalafil', 'Talc Dusting Powder', 'Tamoxifen Citrate', 'Tamsulosin', 'Tazarotene', 'Tegaserod', 'Telbivudine', 'Temazepam', 'Temozolomide', 'Tenecteplase', 'Tenoxicam', 'Terazosin', 'Terbinafine', 'Terbinafine Hydrochloride', 'Testosterone', 'Tetanus Antitoxin', 'Tetracaine Hydrochloride', 'Tetracycline', 'Tetracycline Hydrochloride', 'Tetrahydrozoline Hydrochloride', 'Thalidomide', 'Theophylline (Anhydrous Theophylline)', 'Thiabendazole', 'Thiamine + Pyridoxine', 'Thiamine Hydrochloride (Vitamin B1)', 'Thiamphenicol', 'Thioridazine Hydrochloride', 'Thiotepa', 'Thyroxine Sodium', 'Ticagrelor', 'Tigecycline', 'Timolol + Dorlzolamide', 'Timolol + Pilocarpine', 'Timolol Maleate', 'Tinidazole', 'Tirofiban', 'TPA', 'Tobramycin', 'Tolbutamide', 'Tolmetin Sodium', 'Tolnaftate', 'Tolterodine', 'Topiramate', 'Tramadol Hydrochloride', 'Tranexamic acid', 'Trastuzumab', 'Travoprost', 'Triamcinolone Acetonide', 'Triamicinolone Acetomide', 'Tri', 'flunomide', 'Trifluoperazine Hydrochloride', 'Trifluridine', 'Trimetazidine', 'Triprolidine Hydrochloride', 'Tropicamide', 'Trypan Blue'], 'U': ['Urea', 'Ursodeoxycholic acid'], 'V': ['Vaborbactam', 'Valbenazine', 'Valsartan', 'Vancuronium Bromide', 'Vardenafil', 'Varenicline', 'Varicella Immunoglobulin G', 'Vasopressin', 'Verapamil', 'Vidarabine', 'Vildagliptin', 'Vinblastine', 'Vincristine Sulphate', 'Vinorelbine', 'Vitamin A', 'Vitamin B1+B6+B12', 'Vitamin D', 'Vitamin E (Tocopherol)', 'Voriconazole'], 'W': ['Warfarin Sodium', 'Water for Injection'], 'X': ['Xylometazoline'], 'Z': ['Zolpidem Tartrate']}
l=[]
for key in dic.keys():
    l.extend(dic[key])

l=str(l)
with open("/home/family/Documents/A2SV-Internal-Hackathon/A2SV-Internal-Hackathon/backend/ample-click/src/auth/schema/LIst_of Medicnes.txt", "w") as file:
    file.write(l)