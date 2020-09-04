<template>
  <div>
    <div class="card">
      <div class="item-name">タンクトップ</div>
      <div class="card-image"></div>
      <v-simple-table height="20rem" class="item-info">
        <tbody>
          <tr v-for="item in desserts" :key="item.name">
            <td class="table-name">{{ item.name }}</td>
            <td class="table-value">{{ item.value }}</td>
          </tr>
        </tbody>
      </v-simple-table>
    </div>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        desserts: [
          {
            name: 'カテゴリー',
            value: 'トップス',
          },
          {
            name: '色',
            value: '黒',
          },
          {
            name: '使用回数',
            value: 4,
          },
          {
            name: 'シーン',
            value: 'スポーツ',
          },
          {
            name: '購入日',
            value: '2020/08/15',
          },
        ],
      }
    },
  }
</script>

<style scoped>
.card{
  grid-area: card;
  box-shadow: 0 7px 10px 2px rgba(0, 0, 0, 0.08);
  background-color:white;
  display: grid;
  grid-template: "... .........  ..." 1.5rem
                 "... item-name  ..." 2rem
                 "... .........  ..." 1rem
                 "... card-image ..." 25rem
                 "... .......... ..." 1rem
                 "... item-info  ..." 20rem
                 / auto 25rem auto
}

.item-name{
  grid-area: item-name;
  text-align: center;
  font-size: 1.5rem;
  font-weight: bold;
}

.card-image{
  grid-area: card-image;
  background-color: black;
}

.item-info{
  grid-area: item-info;
}

.table-name{
  font-weight: bold;
}

</style>