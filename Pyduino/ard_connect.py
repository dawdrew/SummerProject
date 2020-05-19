import requests
import serial
from serial.tools import list_ports
import time
import json
# # http://api.openweathermap.org/data/2.5/weather?q=dresher&appid=d6d8ad8bf09830790c7682b34d393742
# key = "d6d8ad8bf09830790c7682b34d393742"
# location = "dresher"
# url = 'http://api.openweathermap.org/data/2.5/weather?q='+location+'&appid='+key
# req = requests.get(url)
# print(req.status_code)
#
# # reqxml = requests.get(url+"&mode=xml")
# data = req.json()
# # print(data)
COMname = 'Arduino'


def ardcon(COMname):
    comports = list_ports.comports()
    # print(comports[1].description)
    for port in comports:
        try:
            print(port.manufacturer)
            if COMname in port.description:
                ard_comport = port.device
                print("this worked: " + ard_comport)
                break
            elif COMname in port.manufacturer:
                ard_comport = port.device
                print("this worked: " + ard_comport)
                break
        except TypeError:
            pass
        else:
            pass

    try:
        ard_comport
    except NameError:
        print("well, Ardino wasn't connected after all!")
        exit()
    else:
        print("sure, Arduino connected.")

    arduino = serial.Serial(timeout=1)
    arduino.baudrate = 9600
    arduino.port = ard_comport
    arduino.open()
    while 5 > arduino.inWaiting():
        pass
    print(arduino.inWaiting())
    return arduino


if __name__ == "__main__":
    # execute only if run as a script
    arduino = ardcon(COMname)
    arduino.flushInput()
    arduino.write(b'hi')
    print('sent')

    while 5 > arduino.inWaiting():
        pass
    time.sleep(1.2)
    print(arduino.inWaiting())
    from_arduino = arduino.read(arduino.inWaiting()).decode()
    print(from_arduino)

    arduino.write('does this work'.encode())
    print('sent')

    arduino.close() # don't forget to close!!


