// models/products.js
import mongoose from "mongoose";

const ProductoSchema = new mongoose.Schema({
    nombre: { type: String },
    categoria: { type: String },
    precio: { type: Number },
    stock: { type: Number }
}, { timestamps: true });

export default mongoose.models.Producto || mongoose.model("Producto", ProductoSchema);
