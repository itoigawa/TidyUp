<template>
  <div>
    <TheHeader /><br><br>
    <CardsList />
    <TheFooter />
  </div>
</template>

<script>
  import TheHeader from 'components/item/TheHeader.vue';
  import CardsList from 'components/item/CardsList.vue';
  import TheFooter from 'components/TheFooter.vue'

  export default {
    components: {
      TheHeader,
      CardsList,
      TheFooter
    }
  }
</script>

<style scoped>
</style>