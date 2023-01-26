import { defineStore } from 'pinia';
import axios from 'axios';

export const useProductStore = defineStore('products', {
  state: () => {
    return {
      products: [],
      id: 0,
      product: null,
    };
  },
  actions: {
    async getProducts() {
      const { data } = await axios.get('http://localhost:3000/products');
      this.products = data;
    },
  },
});
