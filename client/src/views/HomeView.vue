<template>
  <div>
    <q-responsive :ratio="1.777">
      <q-carousel
        animated
        v-model="slide"
        infinite
        :autoplay="autoplay"
        transition-prev="slide-right"
        transition-next="slide-left"
        @mouseenter="autoplay = false"
        @mouseleave="autoplay = true"
      >
        <q-carousel-slide :name="1" img-src="../assets/slideshow/1.jpg" />
        <q-carousel-slide :name="2" img-src="../assets/slideshow/2.jpg" />
        <q-carousel-slide :name="3" img-src="../assets/slideshow/3.jpg" />
        <q-carousel-slide :name="4" img-src="../assets/slideshow/4.jpg" />
        <q-carousel-slide :name="5" img-src="../assets/slideshow/5.jpg" />
      </q-carousel>
    </q-responsive>
    <div class="q-pa-md row justify-center q-gutter-md">
      <q-card class="my-card" v-for="a in articles" :key="a.id">
        <img :src="`./src/assets/images/intro/${a.image}`" />

        <q-card-section class="card-title-box">
          <div class="text-h6" v-html="a.title"></div>
        </q-card-section>
        <q-card-section> {{ a.text.substring(0, 110) }}... </q-card-section>

        <q-card-section class="text-subtitle2" style="text-align: right">
          <q-btn unelevated @click="openDialog(a.id)">READ MORE...</q-btn>
        </q-card-section>
      </q-card>
    </div>
  </div>
  <ArticleDialog :article="article" v-model:toggle="toggle"></ArticleDialog>
</template>
<script setup>
import { ref } from 'vue';
import ArticleDialog from '../components/ArticleDialog.vue';
import { useArticleStore } from '../stores/articles.js';

const articleStore = useArticleStore();
const articles = articleStore.articles;

const slide = ref(1);
const autoplay = ref(4000);
const toggle = ref(false);

const article = ref();

const openDialog = (id) => {
  article.value = articles.find((a) => a.id == id);

  articleStore.article = article;

  toggle.value = !toggle.value;
};
</script>

<style lang="sass">
.my-card
  width: 300px
  height: 530px
.card-title-box
  height: 80px
</style>
