import requests
import serial
from serial.tools import list_ports
import time
import json
# http://api.openweathermap.org/data/2.5/weather?q=dresher&appid=d6d8ad8bf09830790c7682b34d393742
key = "d6d8ad8bf09830790c7682b34d393742"
location = "dresher"
url = 'http://api.openweathermap.org/data/2.5/weather?q='+location+'&appid='+key
req = requests.get(url)
print(req.status_code)

# reqxml = requests.get(url+"&mode=xml")
data = req.json()
# print(data)

comports = list_ports.comports()
# print(comports[1].description)
for port in comports:
    print(port.description)
    if 'Arduino' in port.description:
        ard_comport = port.device
        print("this worked: "+ard_comport)
try:
    ard_comport
except NameError:
    print("well, Ardino wasn't after all!")
    exit()
else:
    print("sure, Arduino connected.")

arduino = serial.Serial(timeout=1)
arduino.baudrate = 9600
arduino.port = ard_comport
arduino.open()
time.sleep(3)
arduino.write(b'hi')
print('sent')
time.sleep(3)
arduino.write('does this work'.encode())
print('sent')
from_arduino = arduino.read().decode()
print(from_arduino)
arduino.close()

