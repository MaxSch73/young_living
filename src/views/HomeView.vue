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
    <div class="row wrap justify-center q-gutter-lg q-mt-md">
      <q-card class="my-card" v-for="a in articles" :key="a.id">
        <img :src="`./src/assets/images/intro/${a.image}`" />

        <q-card-section>
          <div class="text-h6" v-html="a.title"></div>
        </q-card-section>

        <q-card-section class="q-pt-none">
          {{ a.text.substring(0, 150) }}...
          <div class="text-subtitle2 q-mt-md" @click="toggle = !toggle">READ MORE...</div>
        </q-card-section>
      </q-card>
    </div>
  </div>
  <ArticleDialog v-model:toggle="toggle"></ArticleDialog>
</template>
<script setup>
import { ref } from 'vue';
import { useArticleStore } from '../stores/articles.js';
import ArticleDialog from '../components/ArticleDialog.vue';
const articleStore = useArticleStore();
const articles = articleStore.articles;

const slide = ref(1);
const autoplay = ref(4000);

const toggle = ref(false);
</script>
<style lang="sass">
.my-card
  width: 300px
  height: 530px
.card-title-box
  height: 80px
</style>
