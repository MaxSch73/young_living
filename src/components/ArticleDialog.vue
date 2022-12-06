<template>
  <div>
    <q-dialog v-model="openDialog">
      <q-card>
        <q-card-section>
          <img src="../assets/images/intro/3.jpg" alt="Bild" />
          <div class="text-h6">All About Vitamin B</div>
        </q-card-section>

        <q-card-section class="q-pt-none"> {{ article }} </q-card-section>
        <q-card-section class="q-pt-none"> 2022-10-22 </q-card-section>
        <q-card-section class="q-pt-none"> <i class="fa-solid fa-heart"></i> 32</q-card-section>

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
