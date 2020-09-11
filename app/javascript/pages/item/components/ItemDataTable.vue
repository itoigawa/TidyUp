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
      <!-- <v-select
        label="色"
        name="color"
        v-model="item.color"
        item-text="label"
        item-value="value"
        :items="[
          { label: '-----', value: null },
          { label: 'レッド', value: 1 },
          { label: 'オレンジ', value: 2 },
          { label: 'イエロー', value: 3 },
          { label: 'グリーン', value: 4 },
          { label: 'ブルー', value: 5 },
          { label: 'パープル', value: 6 },
          { label: 'ブラウン', value: 7 },
          { label: 'ブラック', value: 8 },
          { label: 'ホワイト', value: 9 },
          { label: 'その他', value: 10 }
        ]"
        class="select-color"
        @change="loadlist"
      ></v-select>
      <v-select
        label="シーン"
        name="scene"
        v-model="item.scene"
        item-text="label"
        item-value="value"
        :items="[
          { label: '-----', value: null },
          { label: 'ビジネス', value: 0 },
          { label: 'プライベート', value: 1 },
          { label: 'スポーツ', value: 2 }
        ]"
        class="select-scene"
        @change="loadlist"
      ></v-select> -->
    </div>
    <v-data-table
      :headers="headers"
      :items="items"
      :search="searchItem"
      locale="ja-jp"
      no-data-text="データがありません。"
    >
      <!-- <template v-slot:[`item.name`]="{ item }">
        {{ item.name }}
      </template>
      <template v-slot:[`item.category`]="{ item }">
        {{ item.category }}
      </template>
      <template v-slot:[`item.color`]="{ item }">
        {{ item.color }}
      </template>
      <template v-slot:[`item.scene`]="{ item }">
        {{ item.scene }}
      </template>
      <template v-slot:[`item.purchased`]="{ item }">
        {{ item.purchased_at }}
      </template> -->
    </v-data-table>
  </v-card>
</div>
</template>

<script>
export default {
  name: 'ItemDataTable',
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
        { text: '使用回数', value: 'count', sortable: false },
        { text: 'シーン', value: 'scene', sortable: false },
        { text: '購入日', value: 'purchased_at', sortable: false },
      ],
    }
  },
}
</script>

<style scoped>
.search-box{
  min-width: 60rem;
  display: grid;
  grid-template: "... item-search ... select-color ... select-scene ..."
                / 2% 35% auto 18% auto 18% auto;
}

.item-search{
  grid-area: item-search;
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
}
}
</style>