<template>
  <v-card>
    <v-app-bar
      color="#aaacb5"
      dark
      prominent
      src="/assets/headerImage.png"
    >
      <template v-slot:img="{ props }">
        <v-img
          v-bind="props"
          gradient="to top right, rgba(90,90,90), rgba(25,32,72,.7)"
        ></v-img>
      </template>

      <v-toolbar-title>TidyUp</v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn icon
             to="/delete-list"
             class="icon"
             id="item-delete-list">
        <v-icon>mdi-delete-clock-outline</v-icon>
      </v-btn>

      <v-btn icon
             class="icon"
             @click="handleDataTable"
             id="item-data-table">
          <v-icon>mdi-archive-outline</v-icon>
      </v-btn>

      <v-btn icon
             class="icon"
             @click="handleTodayWeather">
        <v-icon>mdi-weather-partly-cloudy</v-icon>
      </v-btn>

      <v-menu
        bottom
        left
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            id="menu"
            icon
            color="yellow"
            v-bind="attrs"
            v-on="on"
          >
            <v-icon>mdi-dots-vertical</v-icon>
          </v-btn>
        </template>

        <v-list>
          <v-list-item>
            <v-icon>mdi-logout</v-icon>
            <router-link
              to="#"
              @click.native="handleLogout"
              class="logout-link"
              >Logout
            </router-link>
          </v-list-item>
        </v-list>
      </v-menu>

      <template v-slot:extension>
        <v-tabs align-with-title>
          <v-tab @click="handleAllItemsList" id="all">全て</v-tab>
          <v-tab @click="handleTopsList" id="tops">トップス</v-tab>
          <v-tab @click="handleOutorList" id="outor">アウター</v-tab>
          <v-tab @click="handlePantsList" id="pants">パンツ</v-tab>
          <v-tab @click="handleShoesList" id="shoes">シューズ</v-tab>
        </v-tabs>
      </template>
    </v-app-bar>
    <v-sheet
      id="scrolling-techniques-4"
      class="overflow-y-auto"
      max-height="600"
    >
    </v-sheet>
  </v-card>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  name: 'ItemHeader',
  methods: {
    ...mapActions("users", ["logoutUser"]),
    async handleLogout() {
      try {
        await this.logoutUser()
        this.$router.push({name: 'LoginIndex'})
      } catch (error) {
        console.log(error)
      }
    },
    handleDataTable(){
      this.$emit('data-table')
    },
    handleTodayWeather(){
      this.$emit('today-weather')
    },
    handleAllItemsList(){
      this.$emit('all-items-list')
    },
    handleTopsList(){
      this.$emit('tops-list')
    },
    handleOutorList(){
      this.$emit('outor-list')
    },
    handlePantsList(){
      this.$emit('pants-list')
    },
    handleShoesList(){
      this.$emit('shoes-list')
    }
  }
}
</script>

<style scoped>
.v-toolbar__title{
  margin-left: 1rem;
}

.logout-link{
  text-decoration: none;
  color: black;
}

.icon{
  text-decoration: none;
  color: white;
}
</style>
