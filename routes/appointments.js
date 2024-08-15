import express from "express";
import {
  createAppointment,
  getAppointmentsForUser,
  getAllAppointments,
  getAppointmentsForClinic,
} from "../database/appointments.js";

const router = express.Router();

router.post("/appointment", async (req, res) => {
  const { clinicId, patientId, dayId, timeId, date, status } = req.body;

  try {
    const newAppointment = await createAppointment(
      clinicId,
      patientId,
      dayId,
      timeId,
      date,
      status
    );
    res.status(201).json(newAppointment);
  } catch (error) {
    res.status(500).json({ error: "Failed to create appointment" });
  }
});


router.get("/user_appointments/:userId", async (req, res) => {
  const userId = req.params.userId;

  try {
    const appointments = await getAppointmentsForUser(userId);
    res.json(appointments);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch appointments for user" });
  }
});

router.get("/appointments", async (req, res) => {
  const { date, timeId } = req.query;

  try {
    const appointments = await getAllAppointments(date, timeId);
    res.json(appointments);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch appointments" });
  }
});

router.post("/clinic_appointments/:clinicId", async (req, res) => {
  const clinicId = req.params.clinicId;
  const { date } = req.body;

  try {
    const appointments = await getAppointmentsForClinic(clinicId, date);
    res.json(appointments);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch appointments for clinic" });
  }
});

export default router;
