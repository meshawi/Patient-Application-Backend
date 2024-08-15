import express from "express";
import {
  getAllClinics,
  getClinicDetials,
} from "../database/clinics.js";

const router = express.Router();

router.get("/clinics", async (req, res) => {
  try {
    const clinics = await getAllClinics();
    res.json(clinics);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch clinics" });
  }
});

router.get("/clinic_detials/:clinicId", async (req, res) => {
  const clinicId = req.params.clinicId;
  try {
    const clinicOperatingHours = await getClinicDetials(clinicId);
    res.json(clinicOperatingHours);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch clinic operating hours" });
  }
});

export default router;
