<template>
<div class="col-sm-12 col-lg-4 mb-3">
  <div
    class="card"
    :id="'item-' + item.id">
    <img src="assets/sample_wear.png" 
         class="card-image"
         @click="handleDetailItem(item)">
    <div class="card-box">
      <h3 class="card-title">{{ item.name }}</h3>
      <div class="card-icons">
        <v-btn icon>
          <v-icon>mdi-pencil</v-icon>
        </v-btn>
        <v-btn icon>
          <v-icon>mdi-delete</v-icon>
        </v-btn>
      </div>
    </div>
  </div>
</div>
</template>

<script>
export default {
  name: 'ItemCard',
  props: {
    item: {
      type: Object,
      required: true
    }
  },
  methods: {
    handleDetailItem(item) {
      this.$emit('detail-item', item)
    }
  }
}
</script>

<style scoped>
.card {
  display: grid;
  grid-template:
    "card-image" 84%
    ".........." auto
    "card-box"   10%;
  box-shadow: 5px 10px 20px rgba(0,0,0,0.25);
  border-radius: 3px;
  border: 4px solid white;
}

.card-image {
  grid-area: card-image;
  width: 100%;
}

.card-box{
  display: grid;
  grid-area: card-box;
  grid-template:
    "... .......... ... .......... ..." auto
    "... card-title ... card-icons ..." 85%
    / 5% 70% auto 25% 1%;
}

.card-title {
  grid-area: card-title;
  font-weight: 550;
  font-size: 1.5rem;
}

.card-icons{
  grid-area: card-icons;
}

@media screen and (max-width: 1050px){
  .card {
    grid-template:
      "card-image" 91.5%
      "card-box"   8.5%;
  }

  .card-box{
    grid-template:
      "... card-title ... card-icons ..." 97%
      / auto 70% auto 24% 1%;
  }
}
</style>