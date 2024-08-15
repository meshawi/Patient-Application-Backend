import { check } from "express-validator";

export const createPationtValidator = [
  check("firstname")
    .exists()
    .withMessage("Firstname is required")
    .notEmpty()
    .withMessage("Firstname is required")
    .isString()
    .withMessage("Firstname must be a string")
    .matches(/^[A-Za-z]{3,16}$/)
    .withMessage(
      "Firstname must be between 3 and 16 characters and contain only letters"
    ),
  check("lastname")
    .exists()
    .withMessage("Lastname is required")
    .notEmpty()
    .withMessage("Lastname is required")
    .isString()
    .withMessage("Lastname must be a string")
    .matches(/^[A-Za-z]{3,16}$/)
    .withMessage(
      "Lastname must be between 3 and 16 characters and contain only letters"
    ),
  check("mobile")
    .exists()
    .withMessage("Mobile is required")
    .notEmpty()
    .withMessage("Mobile is required")
    .matches(/^05\d{8}$/)
    .withMessage("Mobile must be 10 digits long and start with '05'"),
  check("email")
    .exists()
    .withMessage("Email is required")
    .matches(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)
    .withMessage("Email is not valid"),
  check("password")
    .exists()
    .withMessage("Password is required")
    .notEmpty()
    .withMessage("Password is required")
    .matches(
      /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/
    )
    .withMessage(
      "Password must be between 8 and 16 characters long, and contain at least 1 lowercase letter, 1 uppercase letter, 1 number, and 1 symbol"
    ),
  check("city")
    .exists()
    .withMessage("City is required")
    .notEmpty()
    .withMessage("City is required")
    .isString()
    .withMessage("City must be a string")
    .matches(/^[A-Za-z\s]{3,}$/)
    .withMessage(
      "City must be at least 3 characters long and contain only letters and spaces"
    ),
  check("birthdate")
    .exists()
    .withMessage("Birthdate is required")
    .notEmpty()
    .withMessage("Birthdate is required")
    .matches(/^\d{4}-\d{2}-\d{2}$/)
    .withMessage("Birthdate must be in the format YYYY-MM-DD"),
  check("gender")
    .exists()
    .withMessage("Gender is required")
    .notEmpty()
    .withMessage("Gender is required")
    .isString()
    .withMessage("Gender must be a string")
    .isIn(["male", "female"])
    .withMessage("Gender must be male or female"),
  check("maritalstatus")
    .exists()
    .withMessage("Maritalstatus is required")
    .notEmpty()
    .withMessage("Maritalstatus is required")
    .isString()
    .withMessage("Maritalstatus must be a string")
    .isIn(["single", "married"])
    .withMessage("Maritalstatus must be single or married"),
];

export const loginValidator = [
  check("email")
    .exists()
    .withMessage("Email is required")
    .matches(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)
    .withMessage("Email is not valid"),
  check("password")
    .exists()
    .withMessage("Password is required")
    .notEmpty()
    .withMessage("Password is required")
    .matches(
      /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/
    )
    .withMessage(
      "Password must be between 8 and 16 characters long, and contain at least 1 lowercase letter, 1 uppercase letter, 1 number, and 1 symbol"
    ),
];
export const updatePasswordValidator = [
  check("email")
    .exists()
    .withMessage("Email is required")
    .matches(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)
    .withMessage("Email is not valid"),
  check("mobile")
    .exists()
    .withMessage("Mobile is required")
    .notEmpty()
    .withMessage("Mobile is required")
    .matches(/^05\d{8}$/)
    .withMessage("Mobile must be 10 digits long and start with '05'"),
  check("newPassword")
    .exists()
    .withMessage("New password is required")
    .notEmpty()
    .withMessage("New password is required")
    .matches(
      /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/
    )
    .withMessage(
      "New password must be between 8 and 16 characters long, and contain at least 1 lowercase letter, 1 uppercase letter, 1 number, and 1 symbol"
    ),
];

export const deleteUserValidator = [
  check("email")
    .exists()
    .withMessage("Email is required")
    .matches(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)
    .withMessage("Email is not valid"),
  check("password")
    .exists()
    .withMessage("Password is required")
    .notEmpty()
    .withMessage("Password is required")
    .matches(
      /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/
    )
    .withMessage(
      "Password must be between 8 and 16 characters long, and contain at least 1 lowercase letter, 1 uppercase letter, 1 number, and 1 symbol"
    ),
];
