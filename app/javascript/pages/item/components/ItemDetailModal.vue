<template>
  <div :id="'item-detail-modal' + item.id">
    <div class="card">
      <div class="item-name">{{ item.name }}</div>
      <div class="card-image"></div>
      <v-simple-table height="20rem" class="item-info">
        <tbody>
          <tr>
            <td class="table-name">カテゴリー</td>
            <td class="table-value">{{ item.category }}</td>
          </tr>
          <tr>
            <td class="table-name">色</td>
            <td class="table-value">{{ item.color}}</td>
          </tr>
          <tr>
            <td class="table-name">使用回数</td>
            <td class="table-value">{{ item.count }}</td>
          </tr>
          <tr>
            <td class="table-name">シーン</td>
            <td class="table-value">{{ item.scene }}</td>
          </tr>
          <tr>
            <td class="table-name">購入日</td>
            <td class="table-value">{{ item.purchased_at }}</td>
          </tr>
        </tbody>
      </v-simple-table>
    </div>
  </div>
</template>

<script>
import TheFooterVue from '../../../components/shared/TheFooter.vue'
  export default {
    name: 'ItemDetailModal',
    props: {
      item: {
        type: Object,
        required: true,
        id: {
          type: Number,
          required: true
        },
        name: {
          type: String,
          required: true
        },
        category: {
          type: String,
          required: true
        },
        color: {
          type: String,
          required: true,

        },
        count: {
          type: String,
          required: true
        },
        scene: {
          type: String,
          required: true
        },
        purchased_at: {
          type: String,
          required: true
        }
      }
    },
    data () {
      return {
      }
    },
  }
</script>

<style scoped>
.card{
  grid-area: card;
  box-shadow: 0 7px 10px 2px rgba(0, 0, 0, 0.08);
  /* border-radius: 3px;
  border: 3px solid white; */
  background-color:white;
  display: grid;
  grid-template: "... .........  ..." 1.5rem
                 "... item-name  ..." 2rem
                 "... .........  ..." 1rem
                 "... card-image ..." 25rem
                 "... .......... ..." 1rem
                 "... item-info  ..." 17rem
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
  width: 40%;
}

@media screen and (max-width: 1050px){
  .card{
    grid-template: "... .........  ..." 1.5rem
                   "... item-name  ..." 2rem
                   "... .........  ..." 1rem
                   "... card-image ..." 18rem
                   "... .......... ..." 1rem
                   "... item-info  ..." 16rem
                   / auto 18rem auto
  }
}

</style>