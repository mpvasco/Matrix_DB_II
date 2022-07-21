# Matrix_DB_II
MySQL Practice:  20220621105635_assignment1.sql



Create product table with following columns:
Productid, name, company, price, manufactured_date, expired_Date
  1. Identify the datatype and create the table. Product id should be unique and it should be auto
  incremented.
  2. Insert at least 5 records.
  3. Decrease the 5% price if manufactured date is less than 31st May, 2021.
  4. Change manufactured date and expired date if price is greater than $10.
  5. Delete the products which are expired.
  6. Retrieve the product name, company and price from the product table.
  7. Retrieve product names only whose price falls between $5 and $6.
  8. Retrieve name of costliest product.
  9. Retrieve minimum and maximum price of product.
  10. Retrieve total number of products.
  11. Retrieve the cost of all products.
  12. Retrieve products of companies like apple, dell, google.
  13. Retrieve the products which name starts with l, ends with p and should have at least three
  characters.
  14. Display information of two cheapest product.
  15. Display information of product which name contains three characters only.
  16. Increase 2% product price if price falls between $10 and $15.
  17. Delete products if company is apple or product is expired.
  18. Add category column in table.
  19. Change size of company column in database.
  20. Add not null constraint in price and expired date



MySQL Midterm:

Q.1 Design database for online movie ticket booking. For that, write queries for creating all
tables with constraints for online movie ticket booking system. Mention all fields with its
data type in query. 

Q.2 Solve the queries with use of below tables: 
Doctor (DoctorId,DoctorName,qualification,DoctorAddress)
Patient (PatientId,PatientName,dob,PatientAddress,gender)
Treatment (TreatmentId,TreatmentDetail)
Charges (DoctorId, TreatmentId, Charges)
Appointment (AppointmentId, DoctorId, PatientId, TreatmentId, AppointmentDate, status)
  1. Created table with all constraints.
  2. Display the appointment information of Dr. Venus.
  3. Display information of all doctors who are presently treating more than 1 patient.
  4. Display details of all doctors who are charging less than $150.
  5. Display details of all doctors whose charges are highest.
  6. Display information of all patients who are being treated by Dr. Bahrudin.
  7. Display information of all female patients who are getting treatment from Dr. Venus.
  8. Display information of patients who have visited the same dentist.
  9. Delete all those information whose appointment was cancelled.
  10. Display all dentists who are presently treating at least 10 patients.
  11. List patient’s details who had taken appointment of tomorrow.
  12. Display minimum, maximum and average charges
