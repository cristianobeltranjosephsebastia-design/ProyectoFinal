// routes/productos.js
import express from "express";
import Producto from "../models/productos.js";

const router = express.Router();

// GET todos
router.get("/", async (req, res) => {
    try {
        const productos = await Producto.find();
        return res.json(productos);
    } catch (error) {
        console.error("GET /api/productos error:", error);
        return res.status(500).json({ error: "Error obteniendo productos" });
    }
});

// GET por ID
router.get("/:id", async (req, res) => {
    const id = req.params.id;
    console.log("GET /api/productos/:id -> id:", id);
    try {
        const producto = await Producto.findById(id);
        if (!producto) {
            console.log("Producto no encontrado para id:", id);
            return res.status(404).json({ error: "Producto no encontrado" });
        }
        return res.json(producto);
    } catch (error) {
        console.error("GET /api/productos/:id error:", error);
        return res.status(400).json({ error: "ID inválido o error buscando" });
    }
});

// POST
router.post("/", async (req, res) => {
    try {
        const nuevoProducto = new Producto(req.body);
        await nuevoProducto.save();
        return res.status(201).json(nuevoProducto);
    } catch (error) {
        console.error("POST /api/productos error:", error);
        return res.status(500).json({ error: "Error creando producto" });
    }
});

// PUT
router.put("/:id", async (req, res) => {
    try {
        const actualizado = await Producto.findByIdAndUpdate(req.params.id, req.body, { new: true });
        if (!actualizado) return res.status(404).json({ error: "No encontrado" });
        return res.json(actualizado);
    } catch (error) {
        console.error("PUT /api/productos/:id error:", error);
        return res.status(500).json({ error: "Error actualizando" });
    }
});

// DELETE
router.delete("/:id", async (req, res) => {
    try {
        const eliminado = await Producto.findByIdAndDelete(req.params.id);
        if (!eliminado) return res.status(404).json({ error: "No encontrado" });
        return res.json({ mensaje: "Eliminado" });
    } catch (error) {
        console.error("DELETE /api/productos/:id error:", error);
        return res.status(500).json({ error: "Error eliminando" });
    }
});

export default router;
