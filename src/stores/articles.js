import { defineStore } from 'pinia';
import articles from '../assets/data/articles.json';

export const useArticleStore = defineStore('articles', {
  state: () => {
    return {
      articles,
      id: 0,
      article: null,
    };
  },
});
