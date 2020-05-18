import requests
import json
# http://api.openweathermap.org/data/2.5/weather?q=dresher&appid=d6d8ad8bf09830790c7682b34d393742
key = "d6d8ad8bf09830790c7682b34d393742"
location = "dresher"
req = requests.get('http://api.openweathermap.org/data/2.5/weather?q='+location+'&appid='+key)
print(req.status_code)






