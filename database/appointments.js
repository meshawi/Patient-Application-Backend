import pool from "./index.js";

export async function createAppointment(clinicId, patientId, dayId, timeId, date, status = 'available') {
  const [result] = await pool.query(
    "INSERT INTO appointments (ClinicID, PatientID, DayID, TimeID, Date, Status) VALUES (?, ?, ?, ?, ?, ?)",
    [clinicId, patientId, dayId, timeId, date, status]
  );
  const appointmentId = result.insertId;
  const [appointment] = await pool.query(
    "SELECT * FROM appointments WHERE AppointmentID = ?",
    [appointmentId]
  );
  return appointment[0];
}


export async function getAppointmentsForUser(userId) {
  const [results] = await pool.query(
    "SELECT * FROM all_appointments WHERE PatientID = ?",
    [userId]
  );
  return results;
}


export async function getAllAppointments(date, timeId) {
  const [results] = await pool.query(
    "SELECT * FROM all_appointments WHERE Date = ? AND TimeID = ?",
    [date, timeId]
  );
  return results;
}

export async function getAppointmentsForClinic(clinicId, date) {
  const [results] = await pool.query(
    "SELECT * FROM all_appointments WHERE ClinicID = ? AND Date = ?",
    [clinicId, date]
  );
  return results;
}
