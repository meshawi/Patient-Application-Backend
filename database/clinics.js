import pool from "./index.js";

export async function getAllClinics() {
  const [results] = await pool.query("SELECT * FROM clinic_schedule");
  return results;
}

export async function getClinicDetials(clinicId) {
  const [results] = await pool.query(
    "SELECT * FROM clinic_time_slots WHERE ClinicID = ?",
    [clinicId]
  );
  return results;
}
