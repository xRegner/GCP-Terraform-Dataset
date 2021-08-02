import json
import mmap

with open("my_file.json", "r") as f:
    my_dict = json.load(f)
    varDestoy = my_dict["prevent_destroy"]
print(my_dict["prevent_destroy"])



#read input file
fin = open("datasets-sample-gcp-xtian/main.tf", "rt")
#read file contents to string
data = fin.read()
#replace all occurrences of the required string
data = data.replace('prevent_destroy = false', 'prevent_destroy = true')
#close the input file
fin.close()
#open the input file in write mode
fin = open("datasets-sample-gcp-xtian/main.tf", "wt")
#overrite the input file with the resulting data
fin.write(data)
#close the file
fin.close()
