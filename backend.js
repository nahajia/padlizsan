const express = require('express')
var cors = require('cors')
const app = express()
const port = 3000

app.use(cors())

app.use(express.static('kepek'))

app.use(express.json())


app.get('/', (req, res) => {
  res.send('Hello World!')
})


app.get('/tema', (req, res) => {

    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'csevego14oszt'
    })
    
    connection.connect()
    
    connection.query('SELECT * from tema', function (err, rows, fields) {
      if (err) throw err
    
      console.log(rows)
      res.send(rows)
    })
    
    connection.end()



    
  })
  app.post('/uzenet', (req, res) => {

    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'csevego14oszt'
    })
    
    connection.connect()
    
    connection.query('SELECT * from uzenet where uzenet_tema_id='+req.body.bevitel1, function (err, rows, fields) {
      if (err) 
        console.log( err)
      else{
      console.log(rows)
      res.send(rows)}
      
    })
    
    connection.end()

    
  })

  app.post('/felvitel', (req, res) => {

    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'csevego14oszt'
    })
    
    connection.connect()
    
    connection.query("INSERT INTO uzenet  VALUES (NULL, '"+req.body.bevitel1+"', '"+req.body.bevitel2+"', '"+req.body.bevitel3+"', "+req.body.bevitel4+")", function (err, rows, fields) {
      if (err) 
        console.log( err)
      else{
      console.log("Sikeres felvitel!")
      res.send("Sikeres felvitel!")}
      
    })
    
    connection.end()

    
  })


app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})