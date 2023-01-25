import { defineStore } from 'pinia';
import articles from '../assets/data/articles.json';
import axios from 'axios';

export const useArticleStore = defineStore('articles', {
  state: () => {
    return {
      articles,
      id: 0,
      article: null,
    };
  },
  actions: {
    async getArticles() {
      const { data } = await axios.get('http://localhost:3000/articles');
      this.articles = data;
    },
  },
});
