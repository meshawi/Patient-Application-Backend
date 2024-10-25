# Patient Application - Backend 

## Overview

The Patient Application Backend is a Node.js-based application designed to manage appointments, clinics, and user data for a healthcare system. This application provides a robust RESTful API for interacting with various resources, such as patients and clinics, facilitating efficient healthcare management.


## Project Structure

```plaintext
patient_application_backend/
├── database
│   └── pationts_db.sql       # SQL commands to create the database structure
├── appointments.js            # Logic for managing appointments
├── clinics.js                 # Logic for managing clinics
├── index.js                   # Main entry point for the application
├── users.js                   # Logic for managing user accounts
├── routes                     # API route definitions
│   ├── appointments.js        # Routes related to appointments
│   ├── clinics.js             # Routes related to clinics
│   └── users.js               # Routes related to users
├── validators                  # Request validation logic
│   └── index.js               # Centralized validation logic
├── .env                        # Environment variables configuration
├── app.js                      # Application setup and configuration
├── helpers.md                 # Documentation for helper functions and utilities
├── package-lock.json          # Dependency lock file
├── package.json               # Project metadata and dependencies
└── pationts_db.sql            # SQL file to set up the database
```


## Database
### File: `pationts_db.sql`
This file contains the SQL commands necessary to create the database structure for the Patient Application. Ensure that you run this script in your MySQL environment after creating the database.

## Environment Variables
Create a `.env` file in the root directory and define the following variables:

```plaintext
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_DATABASE=pationts_db
MYSQL_PASSWORD=
SECRET_KEY=HelloWorld
```
## Starting the Application
1. Ensure you have XAMPP running with Apache and MySQL.
2. Create the database in MySQL.
3. Import the `pationts_db.sql` file to create the necessary tables.
4. Install the required packages by running:
    ```bash
    npm install
    ```
5. Start the server:
    ```bash
    node app.js
    ```
The server will run on port 8080.



## Database Structure

The database for the patient application is structured to manage users, clinics, appointments, and related information effectively. Below is the SQL schema for the database.



1. **Appointments**
    - createAppointment(clinicId, patientId, dayId, timeId, date, status)
    - getAppointmentsForUser(userId)
    - getAllAppointments(date, timeId)
    - getAppointmentsForClinic(clinicId, date)

2. **Users**
    -   getAllPatients()
    -   getPatient(id)
    -   getPatientByEmail(email)
    -   createPatient(...)
    -   updatePassword(email, mobile, newPassword)
    -   deleteUser(email, password)

3. **appointments**
   - **AppointmentID** (INT, PRIMARY KEY, AUTO_INCREMENT): Unique identifier for each appointment.
   - **ClinicID** (INT, FOREIGN KEY): Reference to the clinic where the appointment is scheduled.
   - **PatientID** (INT, FOREIGN KEY): Reference to the patient who made the appointment.
   - **DayID** (INT): Day of the appointment.
   - **TimeID** (INT): Time slot for the appointment.
   - **Date** (DATE): Date of the appointment.
   - **Status** (ENUM('available', 'booked', 'cancelled')): Current status of the appointment.

## Routes

1. **Users**
    - GET /allpatients - Fetch all patients (requires token).
    - POST /createpatient - Create a new patient.
    - POST /login - Authenticate a patient.
    - GET /patient/:email - Fetch patient details by email (requires token).
    - POST /passreset - Reset patient password.
    - DELETE /deleteuser - Delete a user.

2. **Clinics**
    -    GET /clinics - Fetch all clinics.
    -    GET /clinic_details/:clinicId - Fetch clinic operating hour

3. **appointments**
   - POST /appointment - Create a new appointment.
    - GET /user_appointments/:userId - Fetch appointments for a user.
    - GET /appointments - Fetch appointments by date and time.
    - POST /clinic_appointments/:clinicId - Fetch appointments for a clinic

## Frontend Repository

The frontend for this application is located in a separate repository. You can find it at: [Patient Application Frontend](https://github.com/meshawi/Patient-Application-Frontend.git). This repository contains all the necessary components for the user interface, allowing users to interact with the backend services provided by this application.


## Validators
Validation is implemented for creating patients, logging in, updating passwords, and deleting users using **express-validator**. The validators ensure that incoming requests meet the specified criteria.

## Helpers
Refer to **helpers.md** for additional guidance on using regular expressions and dummy data for testing.

## Acknowledgements
This project was developed as part of my college diploma program during my training at King Faisal Hospital and Research Center.
