import Vue from 'vue';
import Router from 'vue-router';
import Students from './components/Students.vue';

Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'Students',
      component: Students,
    },
    
  ],
});
