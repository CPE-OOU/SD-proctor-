Proctoring Website Structure

Development Steps

1. *Landing Page:*
    * Overview of website and its features
    * Call to action for users to register or log in

2. *User or Client Registration Page:*
    * Collect basic information about the user
    * Save information to database

3. *Face Capturing of the User or Client:*
    * Use user's webcam to capture photo of their face
    * Save photo to database

4. *Login Page:*
    * Allow users to log in to their account
    * Redirect logged-in users to exam page

5. *Face Authentication of the User:*
    *  Capture the user's face using the webcam.
    * Send the captured photo and the photo stored in the database to the machine learning endpoint for matching.
    * If the two photos match, allow the user to proceed with the exam.

6. *Exam Page:*
    * Display exam questions
    * Have video monitor to monitor user during exam
    * Call machine learning endpoint every 5 seconds to check user
    * Log out user if machine learning endpoint detects any unauthorized users

7. *Admin Page:*
    * Allow admin to set questions for the exam