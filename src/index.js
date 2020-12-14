const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');
const flash = require('connect-flash');
const session = require('express-session');
const MySQLStore = require('express-mysql-session');
const passport = require('passport');


const { database } = require('./keys');
//Inicializar 
const app = express();
require('./lib/passport')


//Configuraciones
app.set('port', process.env.PORT || 4000); //process.env.PORT = Valida si existe un puerto ya utiliado
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', exphbs({
    defaultLayout: 'main', //nombre de la plantilla principal
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
}))
app.set('view engine', '.hbs');

//Middelwares
app.use(session({
    secret: 'faztmysqlnodesession',
    resave: false,
    saveUninitialized: false,
    store: new MySQLStore(database)
}));
app.use(flash());
app.use(morgan('dev'));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(passport.initialize());
app.use(passport.session());



//Variables Globales 
app.use((req, res, next) => {
    app.locals.success = req.flash('success');
    app.locals.message = req.flash('message');
    app.locals.user = req.user;
    next();
});



// Rutas (Routes)
app.use(require('./routes/index.js'));
app.use(require('./routes/authentication.js'));
app.use('/links', require('./routes/links'));



//Archivos Publicos (codigo al  que el navegador puede acceder)
app.use(express.static(path.join(__dirname, 'public')));


//Iniciar Servidor
app.listen(app.get('port'), () => { //Utiliza la sintexis de linea 8
    console.log('Server on Port', app.get('port')); //muestra mensaje por consola y concatena el puerto definido
});