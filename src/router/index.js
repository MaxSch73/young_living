import { createRouter, createWebHistory } from 'vue-router';
import home from '../views/HomeView.vue';
import oils from '../views/EssentialsOilsView.vue';
import products from '../views/ProductsView.vue';
import socials from '../views/SocialsView.vue';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: home,
    },
    {
      path: '/about',
      name: 'about',
      component: () => import('../views/AboutView.vue'),
    },
    {
      path: '/oils',
      name: 'oils',
      component: oils,
    },
    {
      path: '/products',
      name: 'products',
      component: products,
    },
    {
      path: '/socials',
      name: 'socials',
      component: socials,
    },
  ],
});

export default router;
