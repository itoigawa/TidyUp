<template>
<div class="weather-box">
  <div class="title-box">
    <h3 class="title-name">Weather Forcast</h3>
    <v-btn 
      icon
      class="close-btn"
      @click="handleCloseModal">
        <v-icon small>mdi-close</v-icon>
    </v-btn>
  </div>
  <template v-if="condition.main == 'Rain'">
    <v-img src="assets/rain.jpg" width="600" height="350">
      <div class="weather-info">
        <p class="weather-city">Tokyo</p>
        <p class="weather-condition">Rain</p>
        <p class="weather-temp">{{ temp | roundUp }}&deg;C</p>
      </div>
    </v-img>
  </template>
  <template v-else-if="condition.main == 'Mist'">
    <v-img src="assets/rain.jpg" width="600" height="350">
      <div class="weather-info">
        <p class="weather-city">Tokyo</p>
        <p class="weather-condition">Rain</p>
        <p class="weather-temp">{{ temp | roundUp }}&deg;C</p>
      </div>
    </v-img>
  </template>
  <template v-else-if="condition.main == 'Clouds'">
    <v-img src="assets/cloudy.jpg" width="600" height="350">
      <div class="weather-info">
        <p class="weather-city">Tokyo</p>
        <p class="weather-condition">Clouds</p>
        <p class="weather-temp">{{ temp | roundUp }}&deg;C</p>
      </div>
    </v-img>
  </template>
  <template v-else-if="condition.main == 'Clear'">
    <v-img src="assets/sunny.jpg" width="600" height="350">
      <div class="weather-info">
        <p class="weather-city">{{ city }}</p>
        <p class="weather-condition">{{ condition.main }}</p>
        <p class="weather-temp">{{ temp | roundUp }}&deg;C</p>
      </div>
    </v-img>
  </template>
</div>
</template>

<script>
import axios from '../../../plugins/axios'

export default {
  name: 'TodayWeatherModal',
  data() {
    return {
      city: null,
      temp: null,
      condition: {
        main: null
      }
    }
  },
  methods: {
    handleCloseModal(){
      this.$emit('close-modal')
    },
  },
  mounted: function(){
    axios.get(
      'https://cors-anywhere.herokuapp.com/https://api.openweathermap.org/data/2.5/weather?q=Tokyo,jp&units=metric&appid=46b4509a90656ba5c8c2ee7a23293910'
    )
  .then(function(response){
    console.log(response);
    this.city = response.data.name
    this.temp = response.data.main.temp
    this.condition = response.data.weather[0]
  }.bind(this))
  .catch(function(error){
    console.log(error)
  })
  },
  filters: {
    roundUp(value){
      return Math.ceil(value)
    }
  }
}
</script>

<style scoped>
div{
  margin: 0;
  padding: 0;
}

.title-box{
  display: grid;
  grid-template: "... title-name ... close-btn ..."
                 /25% 50% 17% 5% 3%;
  text-align: center;
}

.title-name{
  margin-top: 0.6rem;
  grid-area: title-name;
}

.close-btn{
  grid-area: close-btn;
}

.weather-info{
  height: 100%;
  display: grid;
  grid-template: "................." 20%
                 "weather-city     " 10%
                 "................." auto
                 "weather-condition" 20%
                 "................." auto
                 "weather-temp     " 10%
                 "................." 20%
}

.weather-city{
  grid-area: weather-city;
  text-align: center;
  color: white;
  font-size: 1.7rem;
  font-weight: bold;
}

.weather-condition{
  grid-area: weather-condition;
  text-align: center;
  color: white;
  font-size: 3rem;
  font-weight: bold;
}

.weather-temp{
  grid-area: weather-temp;
  text-align: center;
  color: white;
  font-size: 1.2rem;
  font-weight: bold;
}
</style>
