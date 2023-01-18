import { defineStore } from 'pinia';
import products from '../assets/data/products.json';

export const useProductStore = defineStore('products', {
  state: () => {
    return {
      products,
      id: 0,
      product: null,
    };
  },
});
