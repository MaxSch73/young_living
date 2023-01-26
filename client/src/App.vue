<template>
  <q-layout view="lHh Lpr lFf">
    <Navbar></Navbar>
    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script setup>
import Navbar from './components/NavbarComp.vue';

import { useArticleStore } from './stores/articles.js';
import { useProductStore } from './stores/products.js';
import { onMounted } from 'vue';

const articleStore = useArticleStore();
const productStore = useProductStore();

onMounted(async () => {
  await articleStore.getArticles();
  await productStore.getProducts();
  console.log(articleStore.articles, productStore.products);
});
</script>
