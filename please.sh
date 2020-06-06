#!/bin/bash
echo run server? type 'y';
read var1;
echo 'which branch? 1 for master, 2 for other';
read var2;
if [ "$var2" == '1' ]
then 
  var2='master';
  echo $var2;
else 
  var2='Train_kiosk';
  echo $var2;
fi
if [ "$var1" == "y" ]
then
  cd /;
  cd /home/pi/Documents/python/fulgen/SummerProject || exit;
  git fetch --all;
  git pull;
  git checkout $var2;
  . venv/bin/activate || exit;
  export FLASK_APP=pykiosk;
  export FLASK_ENV=development;
  flask run --host=0.0.0.0;
else
    echo "okay";
fi
echo 'done'
