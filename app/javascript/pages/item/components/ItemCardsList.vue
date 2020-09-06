<template>
  <div>
    <div class="cards-row">
      <div class="one"
           @click="handleDetailItem">
        <article class="card">
          <img src="assets/sample_wear.png" class="card-image">
          <div class="card-box">
            <h3 class="card-title">フルジップパーカ</h3>
            <div class="card-icons">
              <v-btn icon>
                <v-icon>mdi-pencil</v-icon>
              </v-btn>
              <v-btn icon>
                <v-icon>mdi-delete</v-icon>
              </v-btn>
            </div>
          </div>
        </article>
      </div>
      <div class="two">
        <article class="card">
          <img src="assets/sample_wear.png" class="card-image">
          <div class="card-box">
            <h3 class="card-title">フルジップパーカ</h3>
            <div class="card-icons">
              <v-btn icon>
                <v-icon>mdi-pencil</v-icon>
              </v-btn>
              <v-btn icon>
                <v-icon>mdi-delete</v-icon>
              </v-btn>
            </div>
          </div>
        </article>
      </div>
      <div class="three">
        <article class="card">
          <img src="assets/sample_wear.png" class="card-image">
          <div class="card-box">
            <h3 class="card-title">フルジップパーカ</h3>
            <div class="card-icons">
              <v-btn icon>
                <v-icon>mdi-pencil</v-icon>
              </v-btn>
              <v-btn icon>
                <v-icon>mdi-delete</v-icon>
              </v-btn>
            </div>
          </div>
        </article>
      </div>
      <div class="four">
        <article class="card">
          <img src="assets/sample_wear.png" class="card-image">
          <div class="card-box">
            <h3 class="card-title">フルジップパーカ</h3>
            <div class="card-icons">
              <v-btn icon>
                <v-icon>mdi-pencil</v-icon>
              </v-btn>
              <v-btn icon>
                <v-icon>mdi-delete</v-icon>
              </v-btn>
            </div>
          </div>
        </article>
      </div>
      <div class="five">
        <article class="card">
          <img src="assets/sample_wear.png" class="card-image">
          <div class="card-box">
            <h3 class="card-title">フルジップパーカ</h3>
            <div class="card-icons">
              <v-btn icon>
                <v-icon>mdi-pencil</v-icon>
              </v-btn>
              <v-btn icon>
                <v-icon>mdi-delete</v-icon>
              </v-btn>
            </div>
          </div>
        </article>
      </div>
    </div>
<div class="cards-row">
      <div class="one">
        <article class="card">
          <img src="assets/sample_wear.png" class="card-image">
          <div class="card-box">
            <h3 class="card-title">フルジップパーカ</h3>
            <div class="card-icons">
              <v-btn icon>
                <v-icon>mdi-pencil</v-icon>
              </v-btn>
              <v-btn icon>
                <v-icon>mdi-delete</v-icon>
              </v-btn>
            </div>
          </div>
        </article>
      </div>
      <div class="two">
        <article class="card">
          <img src="assets/sample_wear.png" class="card-image">
          <div class="card-box">
            <h3 class="card-title">フルジップパーカ</h3>
            <div class="card-icons">
              <v-btn icon>
                <v-icon>mdi-pencil</v-icon>
              </v-btn>
              <v-btn icon>
                <v-icon>mdi-delete</v-icon>
              </v-btn>
            </div>
          </div>
        </article>
      </div>
      <div class="three">
        <article class="card">
          <img src="assets/sample_wear.png" class="card-image">
          <div class="card-box">
            <h3 class="card-title">フルジップパーカ</h3>
            <div class="card-icons">
              <v-btn icon>
                <v-icon>mdi-pencil</v-icon>
              </v-btn>
              <v-btn icon>
                <v-icon>mdi-delete</v-icon>
              </v-btn>
            </div>
          </div>
        </article>
      </div>
      <div class="four">
        <article class="card">
          <img src="assets/sample_wear.png" class="card-image">
          <div class="card-box">
            <h3 class="card-title">フルジップパーカ</h3>
            <div class="card-icons">
              <v-btn icon>
                <v-icon>mdi-pencil</v-icon>
              </v-btn>
              <v-btn icon>
                <v-icon>mdi-delete</v-icon>
              </v-btn>
            </div>
          </div>
        </article>
      </div>
      <div class="five">
        <article class="card">
          <img src="assets/sample_wear.png" class="card-image">
          <div class="card-box">
            <h3 class="card-title">フルジップパーカ</h3>
            <div class="card-icons">
              <v-btn icon>
                <v-icon>mdi-pencil</v-icon>
              </v-btn>
              <v-btn icon>
                <v-icon>mdi-delete</v-icon>
              </v-btn>
            </div>
          </div>
        </article>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ItemCardsList',
  methods: {
    handleDetailItem() {
      this.$emit('detail-item')
    }
  }
}
</script>

<style scoped>
.cards-row{
  display: grid;
  grid-template: 
    "...... ... ...... ... ...... ..... ...... .... ... .... ..." 0.5rem
    "...... one ...... two ...... three ...... four ... five ..." 19.5rem
    "...... ... ...... ... ...... ..... ...... .... ... .... ..." 0.5rem
    / auto  19%  auto  19%  auto   19%   auto  19% auto  19% auto;
}

.one{
  grid-area: one;
}

.two{
  grid-area: two;
}

.three{
  grid-area: three;
}

.four{
  grid-area: four;
}

.five{
  grid-area: five;
}

.card {
  width: 100%;
  height: 100%;
  box-shadow: 0 7px 10px 2px rgba(0, 0, 0, 0.08);
  border-radius: 3px;
  border: 3px solid white;
  display: grid;
  grid-template:
    "card-image" 84%
    ".........." auto
    "card-box"   11%;
}

.card-image {
  grid-area: card-image;
  width: 100%;
}

.card-box{
  display: grid;
  grid-area: card-box;
  width: 100%;
  grid-template:
    "... card-title ... card-icons ..." 97%
    / auto 60% 7% 30% auto;
}

.card-title {
  grid-area: card-title;
  font-weight: bold;
}

.card-icons{
  grid-area: card-icons;
}

@media screen and (max-width: 1050px){
  .cards-row{
    grid-template:
      " one "
      " two "
      "three"
      "four "
      "five "
  }

  .card {
    grid-template:
      "card-image" 92.5%
      "card-box"   7.5%;
  }

  .card-box{
    grid-template:
      "... card-title ... card-icons ..." 97%
      / auto 57% auto 27% auto;
  }
}


</style>