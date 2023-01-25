import { createApp } from 'vue';
import { createPinia } from 'pinia';
import { Quasar } from 'quasar';
import { Notify } from 'quasar';

import quasarIconSet from 'quasar/icon-set/fontawesome-v6';
import '@quasar/extras/roboto-font/roboto-font.css';
import '@quasar/extras/material-icons/material-icons.css';
import '@quasar/extras/fontawesome-v6/fontawesome-v6.css';

import 'quasar/src/css/index.sass';

import App from './App.vue';
import router from './router';

const app = createApp(App);

app.use(createPinia());
app.use(router);
app.use(Quasar, {
  plugins: {
    Notify,
  },
  config: {
    notify: {
      /* look at QuasarConfOptions from the API card */
    },
  },
});

app.mount('#app');
