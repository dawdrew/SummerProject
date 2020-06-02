import os
import time
runserver = input('Run Fulgen Server??--Y/n \n')

if runserver == 'yes' or runserver == 'y' or runserver == "Y" or runserver == "Yes":
   os.system('source /home/pi/Documents/python/fulgen/SummerProject/please.sh')
    # os.system("cd /")
    # os.system("cd /home/pi/Documents/python/fulgen/SummerProject")
    # time.sleep(2)
    # os.system(". venv/bin/activate")
    # time.sleep(2)
    # os.system('export FLASK_APP=pykiosk')
    # os.system('export FLASK_ENV=development')
    # os.system('flask run --host=0.0.0.0')
