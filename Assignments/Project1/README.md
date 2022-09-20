# Project1
Name: 		Susheel Jamakayala

Course:		5443 Spatial Databases

Semester:	Fall, 2022	

Assignment:	Program 1 - Simple API using python and PostgreSQL


Assignment Instructions:

  - Install Postgres DB and PostGIS
  - Install pgAdmin4
  - Created DB called Project1 using Public schema
  - Load a data file from the MSU CS server
  - Have the following API routes
    - getAll
    - getOne
    - getClosest

Assignment Description:

Route 1 :
	- Routing to (getAll) will fetch all the information that is stored in the db 
	
example url : http://localhost:8081/home/getAll

Route 2 :
	- Routing to (getOne) along with appropriate parameters will fetch all the information that corresponds to that parameter 

example url :  http://localhost:8081/home/getOne?zip_id=622


Route 2 :
	- Routing to (getClosest) along with a set of latitude and longitude will fetch all the locations that are close to 
	  close to the given parameters
		

example url :  http://localhost:8081/home/getClosest?lat=40.922326&lon=-72.637078
