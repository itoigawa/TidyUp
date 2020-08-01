<template>
<div>
  <IndexHeader />
  <CardsList />
  <ExhibitButton />
  <TheFooter />
</div>
</template>

<script>
  import IndexHeader from 'components/item/IndexHeader'
  import CardsList from 'components/item/CardsList'
  import ExhibitButton from 'components/item/ExhibitButton'
  import TheFooter from 'components/shared/TheFooter'

  export default {
    components: {
      IndexHeader,
      CardsList,
      ExhibitButton,
      TheFooter
    }
  }
</script>

<style scoped>
</style>