import express from "express";
import mongoose from "mongoose";
import cors from "cors";
import productosRoutes from "./routes/productos.js";

const app = express();
app.use(cors());
app.use(express.json());

// RUTAS
app.use("/api/productos", productosRoutes);

// Conexión MongoDB
mongoose.connect("mongodb://localhost:27018/proyecto_final")
    .then(() => console.log("MongoDB conectado"))
    .catch((err) => console.log(err));

app.listen(5000, () => {
    console.log("Servidor en puerto 5000");
});
