import { query } from '../db/index.js';

const dbGetArticles = async () => {
  const { rows } = await query('select * from articles order by id');
  return rows;
};

const dbGetProducts = async () => {
  const { rows } = await query(
    'SELECT p.item_number, p.name, p.image, p.price, p.discount, (SELECT name FROM category WHERE cat_id = p.cat_id) AS category_name FROM products p ORDER BY item_number;',
  );
  return rows;
};

export { dbGetArticles, dbGetProducts };
