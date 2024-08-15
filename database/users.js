import pool from "./index.js";

export async function getAllPationts() {
  const [results] = await pool.query("SELECT * FROM users");
  return results;
}

export async function getPationt(id) {
  const [results] = await pool.query("SELECT * FROM users WHERE id = ?", [id]);
  return results[0];
}

export async function getPationtByEmail(email) {
  const [results] = await pool.query("SELECT * FROM users WHERE email = ?", [
    email,
  ]);
  return results[0];
}

export async function createPationt(
  firstname,
  lastname,
  mobile,
  email,
  password,
  city,
  birthdate,
  gender,
  maritalstatus
) {
  const [result] = await pool.query(
    "INSERT INTO users (firstname, lastname, mobile, email, password, city, birthdate, gender, maritalstatus) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
    [
      firstname,
      lastname,
      mobile,
      email,
      password,
      city,
      birthdate,
      gender,
      maritalstatus,
    ]
  );
  const id = result.insertId;
  return getPationt(id);
}

export async function updatePassword(email, mobile, newPassword) {
  const [result] = await pool.query(
    "UPDATE users SET password = ? WHERE email = ? AND mobile = ?",
    [newPassword, email, mobile]
  );
  return result.affectedRows > 0;
}

export async function deleteUser(email, password) {
  const [result] = await pool.query(
    "DELETE FROM users WHERE email = ? AND password = ?",
    [email, password]
  );
  return result.affectedRows > 0;
}
