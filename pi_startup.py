import os

runserver = input('Run Fulgen Server??--Y/n')

if runserver == 'yes' or runserver == 'y' or runserver == "Y" or runserver == "Yes":
    os.system("cd /")
    os.system("cd /home/pi/Documents/python/fulgen/SummerProject")
    os.system(". venv/bin/activate")
    os.system('export FLASK_APP=pykiosk')
    os.system('export FLASK_ENV=development')
    os.system('flask run --host=0.0.0.0')
