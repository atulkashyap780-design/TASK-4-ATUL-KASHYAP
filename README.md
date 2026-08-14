Project 4: System Vulnerability Checklist

Description

The System Vulnerability Checklist is a basic cybersecurity project developed using R Programming. It helps identify common security weaknesses in a system and unsafe user practices.

The program checks:

- Weak password practices
- Software update status
- Unsafe user practices
- Firewall status
- Antivirus/endpoint protection
- Overall security risk level

After completing the checklist, the program calculates the total number of warnings and gives an overall risk level: LOW, MEDIUM, or HIGH. It also provides recommendations to improve system security.

Technologies Used

- R Programming
- Cybersecurity Fundamentals
- Risk Assessment

How to Run

1. Install R

Make sure R is installed on your computer.

Check whether R is installed:

R --version

2. Clone the Repository

git clone YOUR_GITHUB_REPOSITORY_URL

3. Open the Project Folder

cd Project4

4. Run the Program

Rscript system_vulnerability_checklist.R

The program will ask several security-related Yes/No questions. Enter "y" for Yes and "n" for No.

Example

Do you use short passwords (less than 12 characters)? (y/n): y
Do you reuse the same password on multiple accounts? (y/n): n
Are there any pending operating-system or important software updates? (y/n): y

The program will then generate a security report such as:

Password security : WARNING
Software updates  : WARNING
User practices    : PASS
Basic system      : PASS

Total warnings    : 2
Overall risk      : MEDIUM

Project Goal

The goal of this project is to demonstrate basic system security assessment, risk identification, and cybersecurity awareness using R programming.

Disclaimer

This project is created for educational and defensive cybersecurity purposes only. It is a basic security checklist and is not a complete vulnerability scanner. It does not exploit or attack any system.
