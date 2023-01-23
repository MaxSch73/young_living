<template>
  <div class="q-pa-md">
    <q-table
      ref="tableRef"
      class="my-sticky-header-table text-primary"
      title="Our Products"
      :rows="products"
      :columns="columns"
      row-key="id"
      v-model:pagination="pagination"
      :filter="filter"
      binary-state-sort
      style="height: 80vh"
      :visible-columns="filteredColumns()"
      :rows-per-page-options="[20]"
    >
      <template #body-cell-price="props">
        <div class="column wrap text-right q-mr-md">
          <span class="text-bold">€ {{ props.row.discount.toFixed(2) }}</span>
          <span>(€ {{ props.row.price }})</span>
        </div>
      </template>
      <template #body-cell-image="props">
        <img
          @click="openImage(props.row.itemNumber)"
          :src="`../../src/assets/images/products/${props.row.image}`"
          :alt="props.row.name"
        />
      </template>
      <template #top-right>
        <q-input
          class="text-black"
          borderless
          dense
          debounce="300"
          v-model="filter"
          placeholder="Search"
        >
          <template #append>
            <q-icon name="search" />
          </template>
        </q-input>
      </template>
    </q-table>
  </div>
  <q-dialog v-model="show">
    <q-card class="my-card2">
      <q-img :src="`../../src/assets/images/products/${product.image}`"></q-img>
      <q-btn
        size="1.5rem"
        class="absolute fixed-top-right q-my-md q-px-md q-py-ld q-mr-md"
        color="primary"
        round
        >€ {{ product.discount }}</q-btn
      >
      <p class="absolute fixed-bottom text-center text-h6">{{ product.name }}</p>
    </q-card>
  </q-dialog>
</template>

<script setup>
import { ref } from 'vue';
import { useProductStore } from '../stores/products';
import { useQuasar } from 'quasar';

const $q = useQuasar();

const productStore = useProductStore();
const products = productStore.products;

const filter = ref('');
const pagination = ref({
  rowsPerPage: 0,
});

const openImage = (id) => {
  console.log(id);
  product.value = products.find((p) => p.itemNumber == id);

  productStore.product = product.value;

  show.value = !show.value;
};

const show = ref(false);
const product = ref(null);

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
  { name: 'image', align: 'right', label: 'Image', field: 'image', sortable: false },
  { name: 'name', align: 'center', label: 'Name', field: 'name', sortable: true },
  { name: 'category', align: 'center', label: 'Category', field: 'category' },
  { name: 'price', align: 'right', label: 'Price', field: 'price', sortable: true },
];
</script>
<style lang="sass">
img
  width: 100px
  height: 100px

.my-sticky-header-table

  .q-table__top
    /* bg color is important for th; just specify one */
    background-color: #FFD84D

.my-card2
    width: 100%
    height: 70%
</style>
