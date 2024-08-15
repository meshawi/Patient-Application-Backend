import express from "express";
import {
  getAllPationts,
  createPationt,
  getPationtByEmail,
  updatePassword,
  deleteUser,
} from "../database/users.js";
import { validationResult } from "express-validator";
import {
  createPationtValidator,
  loginValidator,
  updatePasswordValidator,
  deleteUserValidator,
} from "../validators/index.js";
import jwt from "jsonwebtoken";

const router = express.Router();

router.get("/allpationts", checkToken, async (req, res) => {
  jwt.verify(req.token, process.env.SECRET_KEY, async (err, data) => {
    if (err) {
      res.sendStatus(403);
    } else {
      const allPationts = await getAllPationts();
      res.send(allPationts);
    }
  });
});

router.post("/createpationt", createPationtValidator, async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  console.log("Request body:", req.body); // Log the request body

  const {
    firstname,
    lastname,
    mobile,
    email,
    password,
    city,
    birthdate,
    gender,
    maritalstatus,
  } = req.body;
  await createPationt(
    firstname,
    lastname,
    mobile,
    email,
    password,
    city,
    birthdate,
    gender,
    maritalstatus
  );
  res.send("Pationt created");
});

router.post("/login", loginValidator, async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  console.log("Request body:", req.body); // Log the request body
  const { email, password } = req.body;

  const user = await getPationtByEmail(email);
  if (user && user.password === password) {
    const token = jwt.sign({ email }, process.env.SECRET_KEY, {
      expiresIn: "60s",
    });
    res.json({
      token: token,
      id: user.id,
      email: email,
      firstname: user.firstname,
      lastname: user.lastname,
    });
  } else {
    res.status(401).json({ message: "Invalid email or password" });
  }
});

router.get("/pationt/:email", checkToken, async (req, res) => {
  jwt.verify(req.token, process.env.SECRET_KEY, async (err) => {
    if (err) {
      res.sendStatus(403);
      return;
    } else {
      const email = req.params.email;
      const Pationts = await getPationtByEmail(email);
      res.send(Pationts);
    }
  });
});

router.post("/passreset", updatePasswordValidator, async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  const { email, mobile, newPassword } = req.body;
  const result = await updatePassword(email, mobile, newPassword);
  if (result) {
    res.send("Password updated");
  } else {
    res.status(400).send("Invalid email or mobile");
  }
});

router.delete("/deleteuser", deleteUserValidator, async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }
  const { email, password } = req.body;
  const result = await deleteUser(email, password);
  if (result) {
    res.send("User deleted");
  } else {
    res.status(400).send("Invalid email or password");
  }
});

function checkToken(req, res, next) {
  const header = req.headers["authorization"];
  if (typeof header !== "undefined") {
    const bearer = header.split(" ");
    const token = bearer[1];
    req.token = token;
    next();
  } else {
    res.sendStatus(403);
  }
}

export default router;
