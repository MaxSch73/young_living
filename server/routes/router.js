import express from 'express';
import asyncHandler from 'express-async-handler';

import { getArticles, getProducts } from '../controllers/controller.js';

const router = express.Router();

router.get('/articles', asyncHandler(getArticles));
router.get('/products', asyncHandler(getProducts));

export default router;
