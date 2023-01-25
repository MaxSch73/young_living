<script setup>
import { useVModel } from '@vueuse/core';
const props = defineProps({ toggle: { type: Boolean, required: true, default: false } });
const emit = defineEmits(['update:toggle']);
const leftDrawerOpen = useVModel(props, 'toggle', emit);
</script>
<template>
  <q-drawer v-model="leftDrawerOpen" :width="220" show-if-above side="left" elevated>
    <q-list>
      <q-item-label header class="q-mt-md">EXPLORE OUR SITE</q-item-label>
      <q-item clickable active-class="bg-primary text-white" to="/">
        <q-item-section avatar>
          <i class="fa-solid fa-house"></i>
        </q-item-section>
        <q-item-section>
          <q-item-label>Home</q-item-label>
        </q-item-section>
      </q-item>
      <q-item clickable active-class="bg-primary text-white" to="/oils">
        <q-item-section avatar>
          <i class="fa-solid fa-droplet"></i>
        </q-item-section>
        <q-item-section>
          <q-item-label>Essential Oils</q-item-label>
        </q-item-section>
      </q-item>
      <q-item clickable active-class="bg-primary text-white" to="/products">
        <q-item-section avatar>
          <i class="fa-solid fa-magnifying-glass"></i>
        </q-item-section>
        <q-item-section>
          <q-item-label>Search Products</q-item-label>
        </q-item-section>
      </q-item>
      <q-item clickable active-class="bg-primary text-white" to="/about">
        <q-item-section avatar>
          <i class="fa-solid fa-address-card"></i>
        </q-item-section>
        <q-item-section>
          <q-item-label>About Us</q-item-label>
        </q-item-section>
      </q-item>
    </q-list>
    <q-list>
      <q-item-label header class="q-mt-md">Contact Us</q-item-label>
      <q-item clickable active-class="bg-primary text-white" to="/socials">
        <q-item-section avatar>
          <i class="fa-solid fa-envelope"></i>
        </q-item-section>
        <q-item-section>
          <q-item-label>Email</q-item-label>
        </q-item-section>
      </q-item>
      <q-item clickable active-class="bg-primary text-white" to="/socials">
        <q-item-section avatar>
          <i class="fa-brands fa-facebook"></i>
        </q-item-section>
        <q-item-section>
          <q-item-label>Facebook</q-item-label>
        </q-item-section>
      </q-item>
      <q-item clickable active-class="bg-primary text-white" to="/socials">
        <q-item-section avatar>
          <i class="fa-brands fa-twitter"></i>
        </q-item-section>
        <q-item-section>
          <q-item-label>Twitter</q-item-label>
        </q-item-section>
      </q-item>
      <q-item clickable active-class="bg-primary text-white" to="/socials">
        <q-item-section avatar>
          <i class="fa-brands fa-instagram"></i>
        </q-item-section>
        <q-item-section>
          <q-item-label>Instgram</q-item-label>
        </q-item-section>
      </q-item>
    </q-list>
  </q-drawer>
</template>
