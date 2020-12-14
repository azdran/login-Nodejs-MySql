const bcrypt = require('bcryptjs');
const passport = require('passport');
const helpers = {};

helpers.encryptpassword = async(password) => {
    const salt = await bcrypt.genSalt(10); //Gernra un Hash 
    const hash = await bcrypt.hash(password, salt);
    return hash;
};

helpers.matchPassword = async(password, savePassword) => {
    try {
        return await bcrypt.compare(password, savePassword);
    } catch (e) {
        console.log(e);
    }
};

module.exports = helpers;