<template #top-right>
  <q-input dense debounce="300" v-model="filter" placeholder="Search">
    <template #append>
      <q-icon name="search" />
    </template>
  </q-input>
  <div class="q-pa-md">
    <q-table title="Products" :rows="products" :columns="columns" row-key="name" />
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useProductStore } from '../stores/products';
import { useQuasar } from 'quasar';

const $q = useQuasar();

const productStore = useProductStore();
const products = productStore.products;

const filter = ref('');

const filteredColumns = () => {
  const cols = ['name', 'price'];
  if ($q.screen.gt.xs) cols.push('image');
  if ($q.screen.gt.sm) cols.push('item', 'category');
  return cols;
};

const columns = [
  {
    name: 'itemNumber',
    required: true,
    label: 'Item #',
    field: 'itemNumber',
    align: 'left',
    sortable: false,
  },
  { name: 'image', align: 'center', label: 'Image', field: 'Image', sortable: false },
  { name: 'name', align: 'center', label: 'Name', field: 'name', sortable: true },
  { name: 'category', align: 'center', label: 'Category', field: 'Category' },
  { name: 'price', align: 'right', label: 'Price', field: 'Price' },
];
</script>
