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
</script>
