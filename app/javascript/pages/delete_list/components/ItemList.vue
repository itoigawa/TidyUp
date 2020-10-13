<template>
<div class="container pt-3">
  <div class="row">
    <div class="col-12">
      <div class="row">
        <template v-for="item in items">
          <ItemCard
            :key="item.id"
            :item="item"
            @detail-item="$listeners['detail-item']"
            @delete-item="$listeners['delete-item']"
            />
        </template>
      </div>
    </div>
  </div>
</div>
</template>

<script>
import ItemCard from './ItemCard'

export default {
  name: 'ItemList',
  components: {
    ItemCard
  },
  props: {
    items: {
      type: Array,
      required: true
    }
  }
}
</script>

<style scoped>
@media screen and (max-width: 1050px) {
  .row{
    display: flex;
    flex-direction: column;
  }
}
</style>
