const passport = require('passport'); //importa la modulo passport y lo almacena en una constante
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database');
const helpers = require('../lib/helpers');

passport.use('local.signin', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
}, async(req, username, password, done) => {

    const rows = await pool.query('SELECT * FROM users WHERE username = ?', [username]);
    if (rows.length > 0) {
        const user = rows[0];
        const validPassword = await helpers.matchPassword(password, user.password);
        if (validPassword) {
            done(null, user, req.flash('success', 'BIENVENIDO' + user.username));
        } else {
            done(null, false, req.flash('message', 'Contraseña Invalida'));
        }
    } else {
        return done(null, false, req.flash('message', 'El nombre de Usuario No Existe'));
    }
}));

passport.use('local.signup', new LocalStrategy({
    usernameField: 'username',
    passwordField: "password", //define el compo donde recibe la contraseña
    passReqToCallback: true //
}, async(req, username, password, done) => {
    const { fullname } = req.body;
    const newUser = {
        username,
        password,
        fullname
    };
    newUser.password = await helpers.encryptpassword(password);
    const result = await pool.query('INSERT INTO users SET ?', [newUser]);
    newUser.id = result.insertId;
    return done(null, newUser);

}));

passport.serializeUser((user, done) => {
    done(null, user.id);
});

passport.deserializeUser(async(id, done) => {
    const rows = await pool.query('SELECT * FROM users Where id = ?', [id]);
    done(null, rows[0]);
});