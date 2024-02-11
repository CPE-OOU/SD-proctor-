const express = require('express');
const session = require('express-session');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const multer = require('multer');
const fs = require('fs');
const path = require('path');
var cors = require('cors');
const app = express();
const port = 3000;
//session
app.use(cors())
app.use(cookieParser());
app.use(express.json()); 

// Session configuration 
app.use(session({
  secret: 'proctoring',
  resave: false,
  saveUninitialized: true,
  cookie: {
    secure: true, // Set to true in production for HTTPS
    httpOnly: true,
    maxAge: 24 * 60 * 60 * 1000, // Session expires in 1 day
  },
}));

//  body parser
app.use(bodyParser.urlencoded({ extended: false }));
//app.use(cookieParser());

// Set up MySQL connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root_password',
  database: 'db'
});

connection.connect(err => {
    if (err) {
      console.error('Error connecting to MySQL: ' + err.stack);
      return;
    }
    console.log('Connected to MySQL as id ' + connection.threadId);
  })

  // Middleware to check if the user is authenticated
 const storage = multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, 'uploads/');
    },
    filename: (req, file, cb) => {
      // Save the file with its original name
      cb(null, file.originalname);
    },
  });
  const upload = multer({ storage: storage });

const isAuthenticated = (req, res, next) => {
  if (true) {
    //console.log(req.session.authenticated)
    return next();
  } else {
    console.log(req.session.authenticated)
    res.status(401).json({ message: 'Unauthorized' });
  }
};

// Login endpoint
app.post('/login', (req, res) => {
  const { username, password } = req.body;

 // console.log(req.body)
  if (username && password) {
    connection.query(`select * from users where email='${username}' and password='${password}'`,
    function (error, results, fields) {
        if (error) throw error;
        if(results.length>0){
          req.session.authenticated = {userdata:results[0], type:"user"};
            //req.session.save();
            
            res.json(req.session.authenticated); 
        }else {
            // if user is an admin
            connection.query(`select * from admin where email='${username}' and password='${password}'`,
            function (error, results, fields) {
                if (error) throw error;
                if(results.length>0){
                  req.session.authenticatedAdmin = {userdata:results[0], type:"admin"};
                    //req.session.save();
                    
                    res.json(req.session.authenticatedAdmin); 
                }else {
                    res.status(401).json({ message: 'Password or username not valid' });
        
                    
        
        
                  }})

            


          }
     
    })
}else {
    res.status(400).json({ message: 'Password or username missing'});
  }

});

// Logout endpoint
app.post('/logout', (req, res) => {
  req.session.destroy(err => {
    if (err) {
      console.error('Error destroying session: ' + err.stack);
      res.status(500).json({ message: 'Internal Server Error' });
    } else {
      res.json({ message: 'Logout successful' });
    }
  });
});

// upload  IMAGE
app.post('/api/users/imageupload/:id', upload.single('image'), (req, res) => {
  const { id } = req.params;
  const  data  = {"image":req.file.originalname};
  //return false;
  if (!req.file) {
      return res.status(400).send('No file uploaded.');
  }
  //console.log(req.file);

  connection.query('UPDATE users SET ? WHERE id = ?', [data, id], (err, results) => {
    if (err) {
      console.error('Error executing query: ' + err.stack);
      res.status(500).json({ message: 'Internal Server Error' });
    } else {
      res.status(200).send('Image uploaded successfully');
    }
  });

  console.log('Received image:', req.file.size);

 
});

// uploading image for verification
app.post('/api/users/imageupload2/:id', upload.single('image'), (req, res) => {
  const { id } = req.params;
  const  data  = {"image2":req.file.originalname};
  //console.log(req.params);
  //return false;
  if (!req.file) {
      return res.status(400).send('No file uploaded.');
  }
  
  connection.query('UPDATE users SET ? WHERE id = ?', [data, id], (err, results) => {
    if (err) {
      console.error('Error executing query: ' + err.stack);
      res.status(500).json({ message: 'Internal Server Error' });
    } else {
      //console.log(req.file);
      res.status(200).send('Image uploaded successfully');
    }
  });

  console.log('Received image:', req.file.size);

 
});


//get image1
app.get('/api/users/imageupload/:id', (req, res) => {
  const { id } = req.params;

  connection.query('SELECT image FROM users where id=?',[id], (err, results) => {
    if (err) {
      console.error('Error executing query: ' + err.stack);
      res.status(500).json({ message: 'Internal Server Error' });
    } else {
      const filename = results[0].image;
      const imagePath = path.join(__dirname, 'uploads', filename);
      res.sendFile(imagePath);
    }
  });


});

//get image1
app.get('/api/users/imageupload2/:id', (req, res) => {
  const { id } = req.params;

  connection.query('SELECT image2 as image FROM users where id=?',[id], (err, results) => {
    if (err) {
      console.error('Error executing query: ' + err.stack);
      res.status(500).json({ message: 'Internal Server Error' });
    } else {
      const filename2 = results[0].image;
      const imagePath2 = path.join(__dirname, 'uploads', filename2);
      res.sendFile(imagePath2);
    }
  });


});


// users for user verification
app.get('/api/users/verification/:id', async (req, res) => {
  const id =req.params.id
 // console.log(req.hostname+'/api/users/verification/'+id)
  const axios = require("axios").default;
      
  const url =  'https://recognition-backend.onrender.com/recognise';
  const data = {
      records: [
        'https://demo.schautomate.com.ng/api/users/imageupload/'+id
      ],
      image: 'https://demo.schautomate.com.ng/api/users/imageupload2/'+id,
      excemption: [

      ],tolerance:0.3
      
    }
  const options = {
    headers: {
      Authorization: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE3MDA3NDMzODAsInN1YiI6Imd1cnUifQ.diBRasDQC_c9f9Fbu410cQo0saqwZmZ68W6DdTlq4YQ',
      'Content-Type': 'application/json'
    }
  }
  axios.post(url, data, options).then(function (response) {
    res.json(response.data);
  }).catch(function (error) {
    console.error(error);
  });
  
});




// users registration
app.post('/api/users/register', (req, res) => {
  params= req.body
  // insert registration data to users table
  connection.query("INSERT INTO users SET ? ",params, (err, results) => {
    if (err) {
      console.error('Error executing query: ' + err.stack);
      res.status(500).json({ message: 'Internal Server Error' });
    } else {
      res.json({ message: 'Registration Sucessful', id:results.insertId });
    }
  });
});

//  view registered users
app.get('/api/users', isAuthenticated, (req, res) => {
  console.log('Session in /api/users:', req.session);
  // Retrieve data from the database
  connection.query('SELECT * FROM users', (err, results) => {
    if (err) {
      console.error('Error executing query: ' + err.stack);
      res.status(500).json({ message: 'Internal Server Error' });
    } else {
      res.json(results);
    }
  });
});

//update users
app.put('/api/users/:id', isAuthenticated, (req, res) => {
  const { id } = req.params;
  const  data  = req.body;
  console.log(req.body)
  // Update data in the database
  connection.query('UPDATE users SET ? WHERE id = ?', [data, id], (err, results) => {
    if (err) {
      console.error('Error executing query: ' + err.stack);
      res.status(500).json({ message: 'Internal Server Error' });
    } else {
      res.json({ message: 'Data updated successfully' });
    }
  });
});

// Delete user
app.delete('/api/users/:id', isAuthenticated, (req, res) => {
  const questionId = req.params.id;
  connection.query("DELETE FROM users WHERE id = ?", questionId, (err, results) => {
    if (err) {
      console.error('Error executing query: ' + err.stack);
      res.status(500).json({ message: 'Internal Server Error' });
    } else {
      res.json({ message: 'Question deleted successfully' });
    }
  });
})

// create exam question
app.post('/api/exam', isAuthenticated, (req, res) => {
  // insert registration data to users table
 const params=req.body;
 connection.query("INSERT INTO exam_question SET ? ",params, (err, results) => {
    if (err) {
      console.error('Error executing query: ' + err.stack);
      res.status(500).json({ message: err.stack });
    } else {
      res.json({ message: 'Registration Sucessful' });
    } 
  });
});

//  view exam question
app.get('/api/exam', isAuthenticated, (req, res) => {
  connection.query('SELECT * FROM exam_question', (err, results) => {
    if (err) {
      console.error('Error executing query: ' + err.stack);
      res.status(500).json({ message: 'Internal Server Error' });
    } else {
      res.json(results);
    }
  });
});
// udate exam
app.put('/api/exams/:id', isAuthenticated, (req, res) => {
  const { id } = req.params;
  const  data  = req.body;
  console.log(req.body)
  // Update data in the database
  connection.query('UPDATE exam_question SET ? WHERE id = ?', [data, id], (err, results) => {
    if (err) {
      console.error('Error executing query: ' + err.stack);
      res.status(500).json({ message: 'Internal Server Error' });
    } else {
      res.json({ message: 'Data updated successfully' });
    }
  });
});


// Delete exam
app.delete('/api/exam/:id', isAuthenticated, (req, res) => {
  const questionId = req.params.id;
  connection.query("DELETE FROM exam_question WHERE id = ?", questionId, (err, results) => {
    if (err) {
      console.error('Error executing query: ' + err.stack);
      res.status(500).json({ message: 'Internal Server Error' });
    } else {
      res.json({ message: 'Question deleted successfully' });
    }
  });
})

process.on('exit', () => {
  connection.end();
});

// Handle CTRL+C
process.on('SIGINT', () => {
  connection.end();
  process.exit();
});


app.listen()