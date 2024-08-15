## My Standerds

**Email**:

- exists
- not empty
- valid

**Password**:

- exists
- not Empty
- min 8
- max 16
- minLowercase 1
- minUppercase: 1
- minNumbers: 1
- minSymbols: 1

**First Name**:

- exists
- not Empty
- isString
- min 3
- max 16
  **Last Name**:
- exists
- not Empty
- isString
- min 3
- max 16

**Mobile Number**:

- exists
- not Empty
- from 0 - 9 ( digits )
- start with 05

**City**:

- exists
- not Empty
- isString
- min 3

**Birthdate**:

- exists
- not Empty
- isDate

**Gender**:

- exists
- not Empty
- isString
- male or female

**Maritalstatus**:

- exists
- not Empty
- isString
- single or married

## Flags

- /cat/`g` = Global (on all text, not just the first result)
- /cat/`i` = Case insensive (dont care about Cases)
- /cat/`m` = multilines (default all text in one line , but now treat every line as its own)

## Expression

- ### +

  - /e`+`/g = one or more e ( e , ee like th`e` str`ee`t )

- ### ?

  - /ea`?`/g = the a is optional ( e, ea like th`e` s`ea`rching)

- ### \*

  - /re`*`/g = the a is optional but you can mach as many as possible like a compnation between + and ? ( r, re like `r`an st`ree`t)

- ### .

  - /`.`at/g = match anything that has at in it ( like `cat` `fat`)

- ### \

  - /`\.`/g = match only the dot ( like end`.`, fun`.`)

  - /t`\.`/g = match only the dot and the character before it ( like en`d.`, fu`n.`)

  - /`\w`/g = match all words ( like `end`. , `fun`.)

    - if we used /`\W`/g its going match anything but words (like end`.` , fun`.` )

  - /`\s`/g = match only white space ( like Hello` ` `World)

    - if we used /`\S`/g its going match anything but not white space (like `Hello` `World` )

  - /`\w{4,5}`/g = match that are 4 to 5 long ( like `that`, `mouse`)

    - \w {`min` , `max`} also you dont have to use both you can say: `\w{4}` = words longer then 4 characters

  - /`\d`/g = look for digits

- ### [ ]
  - /`[fc]at`/g = match only the words that start with f or c and ends with at ( like `fat`, `cat`)
  - /`[a-z]`/g = match all Small letters from a-z
  - /`[A-Z]`/g = match all Capital letters from A-Z
    - /`[a-zA-Z]`/g = match all Capital and small letters from a-z and from A-Z
    - /`[a-c]`/g = match all small letters from a-z
- /`[0-9]`/g = match all number from 0 - 9
- ### ( )

  - /`(t|T)he`/g = match small t or Capptial T and ends with he ( like end`the`, fun`The`)
  - /`(t|e|r){2,3}`/g = match atleast 2-3 of the t,e,r ( like s`tre`, n`et`)

- ### ^
  - /`^T`/g`m` = match only the line that start with T, also notest we used the m flag to treat each line as a line not as one line
- ### $

  - /`\.$`/gm = match only the end of a line that ends with .

- ### < = >

  - look behaind

    - `/(?<=[tT]he).[eE]`/g = match only the words that has The or the before it and this word start with e or E
    - more explain
      - `?<=` look behaind and the = means possitivly
      - `[tT]` means look for t small or capital
      - `.` means any character but line breake
      - `[eE]` the word that we want must start with e small or capital
    - `/(?<=![tT]he).[eE]`/g = match anythign that doesnt have the word the or The before it
      - notes ! means nigitive look behaind

  - look ahead
    - `/.(?=at)`/g = match any character that has at after it (like `f`at, `c`at)
    - `/.(?1at)`/g = match any character dosnt comne after it at (like `water`, `city`)

### Practice for real exrpession

- #### Phone number
- `/\d{3}-?\d{3}-?\d{4}`/gm

  - **0554443333** and **055-444-3333** are valid
  - explain
    - \d{3} for 3 digits
    - -? optional dash ( - )
    - \d{3} for 4 digits

- `/(\d{3})-?\(d{3})-?\(d{4})`/gm
  - i have added each digits into group using ( )
- `/(?<first3digts>\d{3})-?(?<secend3digts>\d{3})-?(?<last4digts>\d{4})`/gm
  - i have added a name for each group using ?< name >
    - (?< first3digts >\d{3}) = 055
    - (?< secend3digts >d{3}) = 444
    - (?< last4digts >\d{4}) = 3333

## Regular expression im going to use

### Email

**Pattern:** `^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$`  
**Explanation:** This checks for a valid email format.

### Password

**Pattern:** `^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,16}$`  
**Explanation:**

- `(?=.*[a-z])`: At least one lowercase letter
- `(?=.*[A-Z])`: At least one uppercase letter
- `(?=.*\\d)`: At least one number
- `(?=.*[@$!%*?&])`: At least one special character
- `[A-Za-z\\d@$!%*?&]{8,16}`: Length between 8 to 16 characters

### First Name

**Pattern:** `^[A-Za-z]{3,16}$`  
**Explanation:** Only letters, length between 3 and 16 characters.

### Last Name

**Pattern:** `^[A-Za-z]{3,16}$`  
**Explanation:** Only letters, length between 3 and 16 characters.

### Mobile Number

**Pattern:** `^05\d{8}$$`  
**Explanation:** 
- ^05: The number must start with "05".
- \d{8}$: Followed by exactly 8 digits.

### City

**Pattern:** `^[A-Za-z\\s]{3,}$`  
**Explanation:** Only letters and spaces, at least 3 characters.

### Birthdate

**Pattern:** `^\\d{4}-\\d{2}-\\d{2}$`  
**Explanation:** Date format YYYY-MM-DD.

### Gender

**Pattern:** `^(male|female)$`  
**Explanation:** Only "male" or "female".

### Marital Status

**Pattern:** `^(single|married)$`  
**Explanation:** Only "single" or "married".


## Dummy inserts SQL
```sql
INSERT INTO users (firstname, lastname, mobile, email, password, city, birthdate, gender, maritalstatus)
VALUES
('John', 'Doe', '0512345678', 'john.doe@example.com', 'Password1!', 'New York', '1990-01-01', 'male', 'single'),
('Jane', 'Smith', '0555555555', 'jane.smith@example.com', 'StrongPass2@', 'Los Angeles', '1985-05-15', 'female', 'married'),
('Emily', 'Johnson', '0523456789', 'emily.johnson@example.com', 'Secure3$', 'Chicago', '1992-03-22', 'female', 'single'),
('Michael', 'Williams', '0534567890', 'michael.williams@example.com', 'SafePassword4#', 'Houston', '1988-07-30', 'male', 'married'),
('Sarah', 'Brown', '0545678901', 'sarah.brown@example.com', 'MyPass5%', 'Phoenix', '1995-09-12', 'female', 'single');
```
## Dummy inserts Json

```json
{
  "users": [
    {
      "firstname": "Alice",
      "lastname": "Williams",
      "mobile": "0567890123",
      "email": "alice.williams@example.com",
      "password": "Example1#",
      "city": "Seattle",
      "birthdate": "1991-02-14",
      "gender": "female",
      "maritalstatus": "single"
    },
    {
      "firstname": "Robert",
      "lastname": "Brown",
      "mobile": "0578901234",
      "email": "robert.brown@example.com",
      "password": "Example2@",
      "city": "Miami",
      "birthdate": "1987-04-21",
      "gender": "male",
      "maritalstatus": "married"
    },
    {
      "firstname": "Jessica",
      "lastname": "Jones",
      "mobile": "0589012345",
      "email": "jessica.jones@example.com",
      "password": "Example3!",
      "city": "Denver",
      "birthdate": "1993-06-08",
      "gender": "female",
      "maritalstatus": "single"
    },
    {
      "firstname": "David",
      "lastname": "Garcia",
      "mobile": "0590123456",
      "email": "davidd.garcia@example.com",
      "password": "Example4$",
      "city": "Boston",
      "birthdate": "1989-09-17",
      "gender": "male",
      "maritalstatus": "married"
    },
    {
      "firstname": "Emma",
      "lastname": "Martinez",
      "mobile": "0501234567",
      "email": "emma.martinez@example.com",
      "password": "Example5%",
      "city": "San Francisco",
      "birthdate": "1996-12-25",
      "gender": "female",
      "maritalstatus": "single"
    }
  ]
}
```
## Smmory i found online

- **Literals**: Characters that match themselves, such as `a`, `1`, or `@`.
- **Metacharacters**: Special characters with a predefined meaning, such as `.` (matches any character) or `*` (matches zero or more occurrences).
- **Character classes**: A set of characters enclosed in square brackets, such as `[a-z]` (matches any lowercase letter).
- **Quantifiers**: Indicate the number of occurrences, such as `*` (zero or more), `+` (one or more), or `?` (zero or one).
- **Anchors**: Specify the position of the match within the string, such as `^` (start of the string) or `$` (end of the string).
- **Modifiers**: Additional flags that modify the behavior of the regex pattern, such as case-insensitive matching or global matching.

### Examples

Here are a few examples of regular expression patterns:

- **Email validation**: `^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$`

  - ^: Start of the string.
  - [a-zA-Z0-9._%+-]+: One or more characters that can be a letter (uppercase or lowercase), digit, dot (.), underscore (\_), percent (%), plus (+), or hyphen (-).
  - @: The "at" symbol.
  - [a-zA-Z0-9.-]+: One or more characters that can be a letter (uppercase or lowercase), digit, dot (.), or hyphen (-).
  - `\.`: A literal dot (.) character.
  - [a-zA-Z]{2,}: Two or more letters (uppercase or lowercase).
  - $: End of the string.

- **Phone number validation**: `^\+\d{1,3}-\d{3}-\d{3}-\d{4}$`
  - ^: Start of the string.
  - \+: A literal plus (+) sign.
  - \d{1,3}: One to three digits representing the country code.
  - -: A literal hyphen (-).
  - \d{3}: Exactly three digits representing the area code.
  - -: A literal hyphen (-).
  - \d{3}: Exactly three digits representing the exchange code.
  - -: A literal hyphen (-).
  - \d{4}: Exactly four digits representing the line number.
  - $: End of the string.


node app.js