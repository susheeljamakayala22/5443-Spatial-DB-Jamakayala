from flask import Flask
import psycopg2

app = Flask(__name__)


@app.route('/')
def homepage():
    return 'Hello All '


@app.route("/fetchAll")
def fetch_all():
    cursor.execute("select * from public.zipcodes")
    result = cursor.fetchall()
    return result


@app.route('/fetchOne/<zip_id>')
def get_zipcode(zip_id):
    zip_id = str(zip_id);
    command = 'SELECT * FROM public.zipcodes WHERE zip_code = ''' + zip_id + ''
    cursor.execute(command)
    data = cursor.fetchall()
    return data


@app.route('/fetchClosest/<latitude>/<longitude>')
def find_closest(latitude, longitude):
    latitude = str(latitude);
    longitude = str(longitude);
    command = 'SELECT  * FROM public.zipcodes WHERE lat = ''' + latitude + ' AND lon = ''' + longitude + ''
    cursor.execute(command)
    data = cursor.fetchall()
    return data


conn = psycopg2.connect(database="Project1", user='postgres', password='1234')
cursor = conn.cursor()

if __name__ == '__main__':
    app.run(debug=True, port='8081')
