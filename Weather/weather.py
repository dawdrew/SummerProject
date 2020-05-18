import requests
import json
# http://api.openweathermap.org/data/2.5/weather?q=dresher&appid=d6d8ad8bf09830790c7682b34d393742
key = "d6d8ad8bf09830790c7682b34d393742"
location = "dresher"
url = 'http://api.openweathermap.org/data/2.5/weather?q='+location+'&appid='+key
req = requests.get(url)
print(req.status_code)

# reqxml = requests.get(url+"&mode=xml")
data = req.json()
print(data)




