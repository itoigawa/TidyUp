<template>
  <div>
    <TheHeader />
    <div class="card-wrapper">
      <div class="card">
        <div class="item-name">タンクトップ</div>
        <!-- <img src="sample_wear.png" alt="手書きの「正義」という文字が縦に大きくマジックで書かれている白いTシャツ" class="card__image"> -->
        <div class="card-image"></div>
        <v-simple-table height="35rem" class="item-info">
          <tbody>
            <tr v-for="item in desserts" :key="item.name">
              <td class="table-name">{{ item.name }}</td>
              <td class="table-value">{{ item.value }}</td>
            </tr>
          </tbody>
        </v-simple-table>
      </div>
    </div>
  </div>
</template>

<script>
import TheHeader from 'components/shared/TheHeader'

  export default {
    components: {
      TheHeader,
    },
    data () {
      return {
        desserts: [
          {
            name: 'タイプ',
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
.card-wrapper{
  min-width: 100vh;
  min-height: 140vh;
  display: grid;
  grid-template: "... .... ..." 
                 "... card ..." 115vh
                 "... .... ..."
                 / auto 50% auto
}

.card{
  grid-area: card;
  box-shadow: 0 7px 10px 2px rgba(0, 0, 0, 0.08);
  background-color:white;
  display: grid;
  grid-template: "... .........  ..." 1.5rem
                 "... item-name  ..." 2.5rem
                 "... .........  ..." 1.5rem
                 "... card-image ..." 30rem
                 "... .......... ..." 3rem
                 "... item-info  ..." 18rem
                 / auto 30rem auto
}

.item-name{
  grid-area: item-name;
  text-align: center;
  font-size: 2rem;
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