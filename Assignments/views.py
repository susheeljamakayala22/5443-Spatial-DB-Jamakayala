import psycopg2
from flask import Blueprint, request

views = Blueprint(__name__, "views")

conn = psycopg2.connect(database="Project1", user='postgres', password='1234')
cursor = conn.cursor()


@views.route("/")
def home():
    return "Home Page"


@views.route("/getAll")
def fetch_all():
    # Sample url for fetching complete data http://localhost:8081/home/getAll
    cursor.execute("select * from public.zip_codes_states")
    result = cursor.fetchall()
    return result


@views.route('/getOne')
def fetch_by_zipcode():
    # Sample url http://localhost:8081/home/getOne?zip_id=622
    args = request.args
    zip_id = args.get('zip_id')
    command = 'SELECT * FROM public.zip_codes_states WHERE zip_code = ''' + zip_id + ''
    cursor.execute(command)
    data = cursor.fetchall()
    return data


@views.route('/getClosest')
def fetch_closest():
    # Sample url http://localhost:8081/home/getClosest?lat=40.922326&lon=-72.637078
    args = request.args
    lat = args.get('lat')
    lon = args.get('lon')
    command = '''SELECT *, ST_Distance(ST_MakePoint(%s,%s), geometric_data) AS dist FROM public.zip_codes_states
     ORDER BY dist LIMIT 10;''' % (lat, lon)
    cursor.execute(command)
    data = cursor.fetchall()
    return data

