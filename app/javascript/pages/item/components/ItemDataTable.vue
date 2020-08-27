<template>
<div>
  <v-card>
    <div class="search-box">
      <v-text-field
      label="商品名"
      v-model="search"
      prepend-inner-icon="mdi-magnify"
      single-line
      hide-details
      class="item-search"
    ></v-text-field>
      <v-select
        label="タイプ"
        name="type"
        item-text="label"
        item-value="value"
        :items="[
          { label: '-', value: null },
          { label: 'トップス', value: 0 },
          { label: 'アウター', value: 1 },
          { label: 'パンツ', value: 2 },
          { label: 'シューズ', value: 3 }
        ]"
        class="select-type"
      ></v-select>
      <v-select
        label="色"
        name="is_open"
        item-text="label"
        item-value="value"
        :items="[
          { label: '-----', value: null },
          { label: 'ホワイト', value: 0 },
          { label: 'ブラック', value: 1 },
          { label: 'グレー', value: 2 },
          { label: 'レッド', value: 3 },
          { label: 'ピンク', value: 4 },
          { label: 'オレンジ', value: 5 },
          { label: 'イエロー', value: 6 },
          { label: 'ブルー', value: 7 },
          { label: 'パープル', value: 8 },
          { label: 'クリーム', value: 9 },
          { label: 'ブラウン', value: 10 },
          { label: 'その他', value: 11 }
        ]"
        class="select-color"
      ></v-select>
      <v-select
        label="シーン"
        name="is_open"
        item-text="label"
        item-value="value"
        :items="[
          { label: '-----', value: null },
          { label: 'ビジネス', value: 0 },
          { label: 'プライベート', value: 1 },
          { label: 'スポーツ', value: 2 }
        ]"
        class="select-scene"
      ></v-select>
    </div>
    <v-data-table
      :headers="headers"
      :items="desserts"
      :search="search"
    ></v-data-table>
  </v-card>
</div>
</template>

<script>
export default {
  data () {
    return {
      search: '',
      headers: [
        {
          text: '商品名',
          align: 'start',
          filterable: false,
          value: 'name',
        },
        { text: '使用回数', value: 'use_times' },
        { text: 'タイプ', value: 'type' },
        { text: '色', value: 'color' },
        { text: 'シーン', value: 'scene' },
        { text: '購入日', value: 'purchase_date' },
      ],
      desserts: [
        {
          name: 'Frozen Yogurt',
          use_times: 159,
          type: 6.0,
          color: 24,
          scene: 4.0,
          purchase_date: '1%',
        },
        {
          name: 'Ice cream sandwich',
          use_times: 237,
          type: 9.0,
          color: 37,
          scene: 4.3,
          purchase_date: '1%',
        },
        {
          name: 'Eclair',
          use_times: 262,
          type: 16.0,
          color: 23,
          scene: 6.0,
          purchase_date: '7%',
        },
        {
          name: 'Cupcake',
          use_times: 305,
          type: 3.7,
          color: 67,
          scene: 4.3,
          purchase_date: '8%',
        },
        {
          name: 'Gingerbread',
          use_times: 356,
          type: 16.0,
          color: 49,
          scene: 3.9,
          purchase_date: '16%',
        },
        {
          name: 'Jelly bean',
          use_times: 375,
          type: 0.0,
          color: 94,
          scene: 0.0,
          purchase_date: '0%',
        },
        {
          name: 'Lollipop',
          use_times: 392,
          type: 0.2,
          color: 98,
          scene: 0,
          purchase_date: '2%',
        },
        {
          name: 'Honeycomb',
          use_times: 408,
          type: 3.2,
          color: 87,
          scene: 6.5,
          purchase_date: '45%',
        },
        {
          name: 'Donut',
          use_times: 452,
          type: 25.0,
          color: 51,
          scene: 4.9,
          purchase_date: '22%',
        },
        {
          name: 'KitKat',
          use_times: 518,
          type: 26.0,
          color: 65,
          scene: 7,
          purchase_date: '6%',
        },
      ],
    }
  },
}
</script>

<style scoped>
.search-box{
  min-width: 100vh;
  display: grid;
  grid-template: "... item-search ... select-type... select-color ... select-scene ..."
                / auto 40% auto 18% auto 18% auto 18% auto;
  margin: 2rem;
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
</style>