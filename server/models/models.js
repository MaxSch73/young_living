import { pool, query } from '../db/index.js';

const dbGetArticles = async () => {
  const { rows } = await query('select * from articles order by id');
  return rows;
};

const dbGetProducts = async () => {
  const { rows } = await query('select * from products join category c on c.cat_id = products.cat_id order by item_number');
  return rows;
};

export { dbGetArticles, dbGetProducts };
