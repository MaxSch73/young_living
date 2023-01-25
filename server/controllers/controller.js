import { dbGetArticles, dbGetProducts } from '../models/models.js';

const getArticles = async (req, res) => res.status(200).json(await dbGetArticles());

const getProducts = async (req, res) => res.status(200).json(await dbGetProducts());

export { getArticles, getProducts };
