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
          @click="prompt = true"
          class="text-primary q-mr-lg q-pa-md"
          dense
          flat
          >Please login
        </q-btn>
        <div v-else>
          <q-btn @click="user.isLoggedIn = false" flat class="text-primary q-mr-md">
            <div class="gt-xs">{{ userFullName }}</div>
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

    <q-dialog v-model="prompt" persistent>
      <q-card style="min-width: 450px">
        <q-card-section class="q-pt-none">
          <q-input
            filled
            ref="firstNameRef"
            hint="First name"
            class="q-my-sm"
            v-model="firstName"
            label="First Name *"
            @keyup.enter="prompt = false"
            lazy-rules
            :rules="nameRules"
          />
          <q-input
            filled
            ref="lastNameRef"
            hint="Last name"
            class="q-my-sm"
            v-model="lastName"
            label="Last Name *"
            @keyup.enter="prompt = false"
            lazy-rules
            :rules="nameRules"
          />
          <q-input
            filled
            ref="ageRef"
            class="q-my-sm"
            v-model="age"
            label="Age *"
            @keyup.enter="prompt = false"
            lazy-rules
            :rules="ageRules"
          />
        </q-card-section>
        <q-toggle v-model="accept" label="I accept the license and terms" />
        <q-card-actions align="left" class="text-primary">
          <q-btn flat label="SUBMIT" @click="submit" class="bg-green text-white" />
          <q-btn flat label="RESET" @click="reset" class="text-black bg-white" />
          <q-btn flat label="CLOSE" class="text-white bg-red" v-close-popup />
        </q-card-actions>
      </q-card>
    </q-dialog>
  </div>
</template>
<script setup>
import { useQuasar } from 'quasar';
import Sidebar from './SidebarComp.vue';
import { ref, onMounted } from 'vue';
import { useUserStore } from '../stores/userStore.js';
import { storeToRefs } from 'pinia';

const userStore = useUserStore();

const { user } = storeToRefs(userStore);

const userFullName = ref(userStore.userFullName);

const $q = useQuasar();

const toggle = ref(false);

const prompt = ref(false);

const firstName = ref('');
const lastName = ref('');
const firstNameRef = ref(null);
const lastNameRef = ref(null);

const age = ref();
const ageRef = ref(null);

const accept = ref(false);

const nameRules = [(val) => (val && val.length > 0) || 'Please type something'];
const ageRules = [
  (val) => (val && val.length > 0) || 'Please type something',
  (val) => (val !== null && val !== '') || 'Please type your age',
  (val) => (val > 0 && val < 100) || 'Please type a real age',
];

onMounted(async () => {
  user.value = userStore.user;
  console.log(user.value);
  console.log(userFullName.value);
});

const submit = () => {
  firstNameRef.value.validate();
  lastNameRef.value.validate();
  ageRef.value.validate();

  if (firstNameRef.value.hasError || ageRef.value.hasError || lastNameRef.value.hasError) {
    $q.notify({
      color: 'negative',
      message: 'Inputs are empty or invalid!',
    });
  } else if (accept.value !== true) {
    $q.notify({
      color: 'negative',
      position: 'top',
      message: 'You need to accept the license and terms first!',
    });
  } else {
    $q.notify({
      icon: 'done',
      color: 'green',
      message: 'Submitted!',
    });
    user.value.firstName = firstName.value;
    user.value.lastName = lastName.value;
    userFullName.value = userStore.userFullName;
    console.log(user.value);
    user.value.isLoggedIn = true;
  }
};

const reset = () => {
  firstName.value = null;
  lastName.value = null;
  age.value = null;
  accept.value = false;

  firstNameRef.value.resetValidation();
  lastNameRef.value.resetValidation();
  ageRef.value.resetValidation();
};
</script>
