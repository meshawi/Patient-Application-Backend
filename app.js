import express from "express";
import dotenv from "dotenv";
import jwt from "jsonwebtoken";
import userRoutes from "./routes/users.js";
import clinicRoutes from "./routes/clinics.js";
import appointmentRoutes from "./routes/appointments.js";
dotenv.config();

const app = express();
app.use(express.json());

// Use routes
app.use(userRoutes);
app.use(clinicRoutes);
app.use(appointmentRoutes);

// Logout route
app.post("/logout", (req, res) => {
  // Invalidate token on the client side
  res.json({ message: "Logout successful" });
});

// Server listening on port 8080
app.listen(8080, () => {
  console.log("Server is running on port 8080");
});
