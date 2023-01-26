<template>
  <div>
    <q-dialog v-model="openDialog">
      <q-card>
        <q-card-section>
          <img :src="`http://localhost:3000/images/articles/${article.image}`" />
          <div class="text-h6" v-html="article.title"></div>
        </q-card-section>

        <q-card-section class="q-pt-none"> {{ article.text }} </q-card-section>
        <q-card-section class="q-pt-none"> {{ article.date }} </q-card-section>
        <q-card-section class="q-pt-none">
          <i class="fa-solid fa-heart"></i> {{ article.likes }}</q-card-section
        >

        <q-card-actions align="right">
          <q-btn flat label="OK" color="primary" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>
  </div>
</template>
<script setup>
import { useVModel } from '@vueuse/core';

const props = defineProps({
  toggle: { type: Boolean, required: true, default: false },
  article: { type: Object, required: true },
});
const emit = defineEmits(['update:toggle']);

const openDialog = useVModel(props, 'toggle', emit);
</script>
