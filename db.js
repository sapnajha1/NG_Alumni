const { Pool } = require("pg");

const pool = new Pool({
    host: "localhost",
    port: 5432,
    database: "ng_alumni",
    user: "alumni_user",
    password: "alumniNG1",
});

module.exports = pool;