<script setup>
import Navbar from './components/NavbarComp.vue';
</script>

<template>
  <q-layout view="lHh Lpr lFf">
    <Navbar></Navbar>
    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script setup>
import { useArticleStore } from '../stores/articles.js';
import { useProdutStore } from '../stores/products.js';
import { onMounted } from 'vue';

const articleStore = useArticleStore();
const productStore = useProdutStore();

onMounted(async () => {
  articleStore.getArticles();
  productStore.getProducts();
  console.log(articleStore.articles, articleStore.products);
});
</script>
