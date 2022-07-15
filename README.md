# musicPlatform

python3 -m venv venv
. venv/bin/activate
pip install Flask
export FLASK_APP=init 
Flask run

ill address being used:
kill -9 $(lsof -ti:5000) 
