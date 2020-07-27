<template>
  <v-card class="overflow-hidden">
    <v-app-bar
      absolute
      color="#aaacb5"
      dark
      shrink-on-scroll
      prominent
      src="/assets/header_image.png"
      fade-img-on-scroll
      scroll-target="#scrolling-techniques-4"
    >
      <template v-slot:img="{ props }">
        <v-img
          v-bind="props"
          gradient="to top right, rgba(90,90,90), rgba(25,32,72,.7)"
        ></v-img>
      </template>

      <v-app-bar-nav-icon></v-app-bar-nav-icon>

      <v-toolbar-title>TidyUp</v-toolbar-title>

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
          <v-list-item
            v-for="(item, i) in items"
            :key="i"
          >
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>

      <template v-slot:extension>
        <v-tabs align-with-title>
          <v-tab>全て</v-tab>
          <v-tab>トップス</v-tab>
          <v-tab>アウター</v-tab>
          <v-tab>パンツ</v-tab>
          <v-tab>シューズ</v-tab>
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
  export default {
    data: () => ({
      items: [
        { title: 'Click Me' },
        { title: 'Click Me' },
        { title: 'Click Me' },
        { title: 'Click Me 2' },
      ],
    }),
  }
</script>

<style scoped>
.v-card{
  padding-bottom: 14.2rem;
}
</style>
