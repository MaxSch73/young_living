<template>
  <div>
    <q-header elevated class="bg-white text-black gt-xs" height-hint="98">
      <q-toolbar>
        <q-btn dense flat round icon="menu" @click="toggle = !toggle" />

        <q-toolbar-title class="row justify-center q-pa-md">
          <q-img width="15vw" src="../../public/Young-Living-Logo.svg" />
        </q-toolbar-title>
        <span>PLEASE LOGIN</span>
      </q-toolbar>
    </q-header>

    <q-header elevated class="bg-primary text-white lt-sm" height-hint="98">
      <q-toolbar>
        <q-btn dense flat round icon="menu" @click="toggle = !toggle" />

        <q-toolbar-title class="row justify-center">
          <img src="../../public/Young-Living-LogoSM.svg" />
        </q-toolbar-title>
      </q-toolbar>
    </q-header>
    <Sidebar v-model:toggle="toggle"></Sidebar>
  </div>
</template>
<script setup>
import Sidebar from './SidebarComp.vue';
import { ref } from 'vue';

const toggle = ref(false);
</script>
