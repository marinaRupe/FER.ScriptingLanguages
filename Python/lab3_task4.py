import urllib.request
import re
import sys
import webbrowser

web_address = "http://www.fer.unizg.hr/predmet/skrjez"
if len(sys.argv) != 2:
    print ("No web address entered!")
    print ("The program will continue with default URL: " + web_address)
else: web_address = sys.argv[1]

webpage = urllib.request.urlopen(web_address).read().decode("utf-8")
print (webpage)
webbrowser.open(web_address)

hosts = dict()
links = re.findall('href="[^"]+"', webpage)
print("Links:")
for link in links:
    link = link.replace("href=", "")[1:-1]
    print(" "*5 + link)

    if link.startswith("http://"):
        host = link.replace("http://", "")
        if host.startswith("www."):
            host = host.replace("www.", "")
        if "/" in host:
            host = host.split("/")[0]

        if host in hosts.keys():
            hosts[host] += 1
        else:
            hosts[host] = 1

print("Hosts:")
for host in hosts.keys():
    print(" "*5 + host + " | number of referencing: " + str(hosts[host]))

emails = re.findall('[\w]+@[\w]+\.[\w]+\.*[\w]*', webpage)
print ("E-mails: ")
for email in emails:
    print(" "*5 + email)

pictures = re.findall('"<img[\s]+src="[^"]+"[^>]+>', webpage)
print("Number of pictures on the page: " + str(len(pictures)))
