<template>
<div>
  <v-card>
    <div class="search-box">
      <v-text-field
      label="商品名"
      name="name"
      v-model="searchItem"
      prepend-inner-icon="mdi-magnify"
      single-line
      hide-details
      class="item-search"
      ></v-text-field>
      <v-btn
        icon
        class="close-btn"
        @click="handleCloseModal">
        <v-icon small>mdi-close</v-icon>
      </v-btn>
    </div>
    <v-data-table
      :headers="headers"
      :items="items"
      :search="searchItem"
      locale="ja-jp"
      no-data-text="データがありません。"
    >
    </v-data-table>
  </v-card>
</div>
</template>

<script>
export default {
  name: 'ItemDataTableModal',
  props: {
    items: {
      type: Array,
      required: true
    }
  },
  data () {
    return {
      searchItem: '',
      headers: [
        { text: '商品名', value: 'name', sortable: false},
        { text: 'カテゴリー', value: 'category', sortable: false },
        { text: '色', value: 'color', sortable: false },
        { text: '使用回数', value: '', sortable: false },
        { text: 'シーン', value: 'scene', sortable: false },
        { text: '購入日', value: 'purchased_at', sortable: false },
      ],
    }
  },
  methods: {
    handleCloseModal(){
      this.$emit('close-modal');
    }
  }
}
</script>

<style scoped>
.search-box{
  min-width: 60rem;
  display: grid;
  grid-template: "... item-search ... close-btn ..."
                / 2% 35% auto 3% 1%;
}

.item-search{
  grid-area: item-search;
}

.close-btn{
  grid-area: close-btn;
}

.select-type{
  grid-area: select-type;
}

.select-color{
  grid-area: select-color;
}

.select-scene{
  grid-area: select-scene;
}

@media screen and (max-width: 1050px){
.search-box{
  min-width: 4rem;
  grid-template: "... item-search ... close-btn ..."
              / 2% 40% auto 8% 3%;
}
}
</style>