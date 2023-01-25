import { defineStore } from 'pinia';

export const useUserStore = defineStore('user', {
  state: () => ({
    user: {
      firstName: '',
      lastName: '',
      isLoggedIn: false,
      likedArticles: null,
    },
  }),
  getters: {
    userFullName: (state) => `${state.user.firstName} ${state.user.lastName}`,
  },
  actions: {},
});
