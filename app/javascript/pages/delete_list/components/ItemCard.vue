<template>
  <div class="col-sm-12 col-lg-4 mb-3">
    <div
      class="card"
      :id="'item-' + item.id">
      <v-img class="card-image grey lighten-3"
             :id="'item-image-' + item.id"
             :src="item.image_url"
             @click="handleDetailItem(item)"
             height="343"
             contain />
      <div class="card-box">
        <h3 class="card-title">{{ item.name }}</h3>
        <div class="card-icons">
          <div class="wearing-times">0回</div>
          <v-btn
            class="card-icon"
            icon
            small
            @click="handleDeleteItem"
            :id="'item-delete-' + item.id"
            >
            <v-icon color="grey lighten-2">mdi-delete</v-icon>
          </v-btn>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axiox from '../../../plugins/axios'
import { mapGetters } from "vuex"

export default {
  name: 'ItemCard',
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
        required: true
      },
      scene: {
        type: Number,
        required: true
      },
      purchased_at: {
        type: String,
        required: true
      },
      user_id: {
        type: Number,
        required: true
      },
    }
  },
  computed: {
    ...mapGetters('items', ['items']),
  },
  methods: {
    handleDetailItem(item) {
      this.$emit('detail-item', this.item)
    },
    handleDeleteItem() {
      this.$emit('delete-item', this.item)
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
  border: 4px solid #363232;
  background-color:#363232;
}

.card-image {
  grid-area: card-image;
}

.card-box{
  display: grid;
  grid-area: card-box;
  grid-template:
    "... .......... ... .........." auto
    "... card-title ... card-icons" 85%
    / auto 80% auto 19%;
}

.card-title {
  grid-area: card-title;
  font-weight: 550;
  font-size: 1.4rem;
  color:lightgray;
}

.card-icons{
  grid-area: card-icons;
  display: grid;
  grid-template:
   "wearing-times card-icon"
   / 55% 45%
}

.wearing-times{
  grid-area: wearing-times;
  font-weight: bold;
  color: lightgray;
  font-size: 1.18rem;
}

.card-icon{
  grid-area: card-icon;
}

@media screen and (max-width: 1050px){
  .card {
    grid-template:
      "card-image" 91.5%
      "card-box"   8.5%;
  }

  .card-box{
    grid-template:
      "... card-title ... card-icons" 97%
      / auto 80% auto 19%;
  }
}
</style>
