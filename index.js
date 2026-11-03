const express = require("express");
const pool = require("./db");
// const { useSyncExternalStore } = require("react");
const app = express();
const uuidRegex = /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;


app.use(express.json());

app.get("/", (req, res) => {
    res.send("NG Alumni Backend is running!");
});

app.get("/users", async (req, res) => {
    try {
        const result = await pool.query("SELECT * FROM users");
        res.json(result.rows);

    } catch (e) {
        res.status(500).json({ message: "Internel server error" });
    }

});

app.post("/users", async (req, res) => {
    try {
        console.log(req.body);

        const {
            full_name,
            gender,
            email,
            phone_number,
            status,
            image_url
        } = req.body;

        if (!full_name || !email) {
            return res.status(400).json({ message: "full_name and email are required" });
        }

        if (!email.includes('@') || !email.includes('.')) {
            console.log("Invalid email address");
            return res.status(400).json({ message: "Invalid email address" });

        }

        const result = await pool.query(
            `INSERT INTO users (
        full_name,
        gender,
        email,
        phone_number,
        status,
        image_url
    )
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING *`,
            [full_name, gender, email, phone_number, status, image_url]
        );
        res.status(201).json(result.rows[0]);

    }

    catch (e) {
        console.log(e.code);
        res.status(500).json({ message: "Internal server error" });
    }


});

app.put("/users/:id", async (req, res) => {
    try {

        const id = req.params.id;
        const status = req.body.status;
        console.log(res.statusCode);

        const result = await pool.query(
            `UPDATE users
        SET status = $1
        WHERE id = $2
        RETURNING *`,
            [status, id]
        );
        if (result.rows.length === 0) {
            res.status(404).json("user not found");
        } else {
            res.json(result.rows[0]);
        }
    } catch (e) {
        res.status(500).json({ message: "Imtrenal server error" });
    }



});

app.delete("/users/:id", async (req, res) => {

    try {
        const id = req.params.id;
        const result = await pool.query(
            `DELETE FROM users
        WHERE id = $1
        RETURNING *`,
            [id]
        );
        if (result.rows.length === 0) {
            res.status(404).json("User not found");
        } else {
            res.json(result.rows[0]);
        }

    } catch (e) {
        res.status(500).json(e.message);
    }

});


pool.query("SELECT NOW()", (error, result) => {
    if (error) {
        console.error("Database connection failed:", error);
    } else {
        console.log("Database connected:", result.rows[0]);
    }
});

app.listen(3000, () => {
    console.log("Server running on http://localhost:3000");
});









// const express = require("express");

// const app = express();

// app.get("/", (req, res) => {
//   res.send("NG Alumni Backend is running!");
// });

// app.listen(3000, () => {
//   console.log("Server running on http://localhost:3000");
// });