<template>
  <div>
    <v-app-bar
      color="#717278"
      dark
    >
      <v-app-bar-nav-icon></v-app-bar-nav-icon>

      <v-toolbar-title>TidyUP</v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn icon>
        <v-icon>mdi-wardrobe-outline</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-calendar-month-outline</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-archive-outline</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-weather-partly-cloudy</v-icon>
      </v-btn>

      <v-menu
        left
        bottom
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            icon
            v-bind="attrs"
            v-on="on"
          >
            <v-icon>mdi-dots-vertical</v-icon>
          </v-btn>
        </template>

        <v-list>
          <v-list-item
            v-for="n in 5"
            :key="n"
            @click="() => {}"
          >
            <v-list-item-title>Option {{ n }}</v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>
    </v-app-bar>
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
  export default {
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
body{
  background-color: #f5f5f5;
}

.card-wrapper{
  background-color: #f5f5f5;
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