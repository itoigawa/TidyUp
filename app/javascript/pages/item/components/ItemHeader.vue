<template>
  <v-card>
    <v-app-bar
      color="#aaacb5"
      dark
      prominent
      src="/assets/header_image.png"
    >
      <template v-slot:img="{ props }">
        <v-img
          v-bind="props"
          gradient="to top right, rgba(90,90,90), rgba(25,32,72,.7)"
        ></v-img>
      </template>

      <v-toolbar-title>TidyUp</v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn icon>
        <v-icon>mdi-wardrobe-outline</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-calendar-month-outline</v-icon>
      </v-btn>

      <v-btn icon
             class="icon"
             @click="handleDataTable">
          <v-icon>mdi-archive-outline</v-icon>
      </v-btn>

      <v-btn icon>
        <v-icon>mdi-weather-partly-cloudy</v-icon>
      </v-btn>

      <v-menu
        bottom
        left
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
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
          <v-tab @click="handleAllItemsList">全て</v-tab>
          <v-tab @click="handleAllTopsList">トップス</v-tab>
          <v-tab @click="handleAllOutorList">アウター</v-tab>
          <v-tab @click="handleAllPantsList">パンツ</v-tab>
          <v-tab @click="handleAllShoesList">シューズ</v-tab>
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
    handleAllItemsList(){
      this.$emit('all-items-list')
    },
    handleAllTopsList(){
      this.$emit('all-tops-list')
    },
    handleAllOutorList(){
      this.$emit('all-outor-list')
    },
    handleAllPantsList(){
      this.$emit('all-pants-list')
    },
    handleAllShoesList(){
      this.$emit('all-shoes-list')
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
