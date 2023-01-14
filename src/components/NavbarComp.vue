<template>
  <div>
    <q-header elevated class="bg-white text-black gt-xs" height-hint="98">
      <q-toolbar>
        <q-btn dense flat round icon="menu" @click="toggle = !toggle" />

        <q-toolbar-title class="row justify-center q-pa-md">
          <q-img width="15vw" src="../../public/Young-Living-Logo.svg" />
        </q-toolbar-title>
        <q-btn
          v-if="!user.isLoggedIn"
          @click="toggleLog = !toggleLog"
          class="text-primary q-mr-lg q-pa-md"
          dense
          flat
          >Please login
        </q-btn>
        <div v-else>
          <q-btn @click="user.isLoggedIn = false" flat class="text-primary q-mr-md">
            <div class="gt-xs">{{ userStore.userFullName }}</div>
            <q-icon class="q-ml-sm" size="1.1rem" name="fa-solid fa-key" />
          </q-btn>
          <q-btn class="text-primary q-mr-lg q-pa-md" dense flat icon="fa-solid fa-shopping-cart">
            <q-badge class="bg-negative q-pa-xs" floating>{{
              Math.round(Math.random() * 20)
            }}</q-badge>
          </q-btn>
        </div>
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
    <LoginDialog v-model:toggle="toggleLog"></LoginDialog>
  </div>
</template>
<script setup>
import Sidebar from './SidebarComp.vue';
import LoginDialog from '../components/LoginDialog.vue';
import { ref, onMounted } from 'vue';
import { useUserStore } from '../stores/userStore.js';
import { storeToRefs } from 'pinia';

const userStore = useUserStore();

const { user } = storeToRefs(userStore);

const toggle = ref(false);

const toggleLog = ref(false);

onMounted(async () => {
  user.value = userStore.user;
});
</script>
