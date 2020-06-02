cd /
cd /home/pi/Documents/python/fulgen/SummerProject || exit
. venv/bin/activate || exit
export FLASK_APP=pykiosk
export FLASK_ENV=development
flask run --host=0.0.0.0