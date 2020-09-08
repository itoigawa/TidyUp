<template>
<div>
  <v-card>
    <div class="search-box" v-if="$mq !== 'sm'">
      <v-text-field
      label="商品名"
      v-model="search"
      prepend-inner-icon="mdi-magnify"
      single-line
      hide-details
      class="item-search"
    ></v-text-field>
      <v-select
        label="カテゴリー"
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
      :items="items"
      :search="search"
    ></v-data-table>
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
      search: '',
      headers: [
        {
          text: '商品名',
          align: 'start',
          filterable: false,
          value: 'name',
        },
        { text: '使用回数', value: 'count' },
        { text: 'カテゴリー', value: 'category' },
        { text: '色', value: 'color' },
        { text: 'シーン', value: 'scene' },
        { text: '購入日', value: 'purchased_at' },
      ],
    }
  },
}
</script>

<style scoped>
.search-box{
  min-width: 60rem;
  display: grid;
  grid-template: "... item-search ... select-type... select-color ... select-scene ..."
                / auto 40% auto 18% auto 18% auto 18% auto;
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