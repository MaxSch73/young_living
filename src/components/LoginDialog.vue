<template>
  <q-dialog v-model="openLogin" persistent>
    <q-card style="min-width: 450px">
      <q-card-section class="q-pt-none">
        <q-input
          filled
          ref="firstNameRef"
          hint="First name"
          class="q-my-sm"
          v-model="firstName"
          label="First Name *"
          @keyup.enter="openLogin = false"
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
          @keyup.enter="openLogin = false"
          lazy-rules
          :rules="nameRules"
        />
        <q-input
          filled
          ref="ageRef"
          class="q-my-sm"
          v-model="age"
          label="Age *"
          @keyup.enter="openLogin = false"
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
</template>

<script setup>
import { useVModel } from '@vueuse/core';
import { useQuasar } from 'quasar';
import { ref } from 'vue';
import { useUserStore } from '../stores/userStore.js';
import { storeToRefs } from 'pinia';

const userStore = useUserStore();

const { user } = storeToRefs(userStore);
const $q = useQuasar();

const props = defineProps({
  toggle: { type: Boolean, required: true, default: false },
});
const emit = defineEmits(['update:toggle']);

const openLogin = useVModel(props, 'toggle', emit);

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
    user.value.isLoggedIn = true;
    reset();
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
</script>
