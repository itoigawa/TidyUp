<template>
<div>
  <TheHeader />
  <div class="form-wrapper">
    <div class="card">
      <div class="title-box">
        <div class="title">アイテムの情報を入力</div>
      </div>
      <div class="image-box">
        <v-file-input
          class="file-input"
          :rules="rules"
          accept="image/png, image/jpeg, image/bmp"
          placeholder="画像をアップロード"
          prepend-icon="mdi-camera"
        ></v-file-input>
        <div class="upload-box"></div>
      </div>
      <div class="info-box">
        <form class="info-form">
          <v-text-field
            v-model="name"
            :error-messages="nameErrors"
            :counter="10"
            label="商品名"
            required
            @input="$v.name.$touch()"
            @blur="$v.name.$touch()"
          ></v-text-field>
          <v-text-field
            v-model="email"
            :error-messages="emailErrors"
            label="メールアドレス"
            required
            @input="$v.email.$touch()"
            @blur="$v.email.$touch()"
          ></v-text-field>
          <v-select
            v-model="select"
            :items="items"
            :error-messages="selectErrors"
            label="タイプ"
            required
            @change="$v.select.$touch()"
            @blur="$v.select.$touch()"
          ></v-select>
          <v-select
            v-model="select"
            :items="items"
            :error-messages="selectErrors"
            label="色"
            required
            @change="$v.select.$touch()"
            @blur="$v.select.$touch()"
          ></v-select>
          <v-select
            v-model="select"
            :items="items"
            :error-messages="selectErrors"
            label="シーン"
            required
            @change="$v.select.$touch()"
            @blur="$v.select.$touch()"
          ></v-select>
          <v-select
            v-model="select"
            :items="items"
            :error-messages="selectErrors"
            label="着用回数の初期値"
            required
            @change="$v.select.$touch()"
            @blur="$v.select.$touch()"
          ></v-select>
           <v-text-field
            v-model="email"
            :error-messages="emailErrors"
            label="購入日"
            required
            @input="$v.email.$touch()"
            @blur="$v.email.$touch()"
          ></v-text-field>

          <v-btn x-large width="100%" color="deep-orange darken-3" right dark  @click="submit" class="register-btn">登録</v-btn>
          <!-- <v-btn color="red" dark @click="clear">消去</v-btn> -->
        </form>
      </div>
    </div>
  </div>
</div>
</template>

<script>
import TheHeader from 'components/shared/TheHeader'
import { validationMixin } from 'vuelidate'
import { required, maxLength, email } from 'vuelidate/lib/validators'

export default {
    components:{
    TheHeader
  },
  mixins: [validationMixin],

  validations: {
    name: { required, maxLength: maxLength(10) },
    email: { required, email },
    select: { required },
    checkbox: {
      checked (val) {
        return val
      },
    },
  },

  data: () => ({
    name: '',
    email: '',
    select: null,
    items: [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
    ],
  }),

  computed: {
    selectErrors () {
      const errors = []
      if (!this.$v.select.$dirty) return errors
      !this.$v.select.required && errors.push('タイプを選択して下さい')
      return errors
    },
    nameErrors () {
      const errors = []
      if (!this.$v.name.$dirty) return errors
      !this.$v.name.maxLength && errors.push('10文字以内で商品名を入力してください')
      !this.$v.name.required && errors.push('商品名を入力してください')
      return errors
    },
    emailErrors () {
      const errors = []
      if (!this.$v.email.$dirty) return errors
      !this.$v.email.email && errors.push('有効なメールアドレスを入力してください')
      !this.$v.email.required && errors.push('メールアドレスを入力してください')
      return errors
    },
  },

  methods: {
    submit () {
      this.$v.$touch()
    },
    clear () {
      this.$v.$reset()
      this.name = ''
      this.email = ''
      this.select = null
      this.checkbox = false
    },
  },
}
</script>

<style scoped>
.form-wrapper{
  min-width: 100vh;
  min-height: 140vh;
  display: grid;
  grid-template:"....  ....  ...."
                "....  card  ...." 123vh
                "....  ....  ...."
                / auto 50% auto
}

.card{
  grid-area: card;
  box-shadow: 0 7px 10px 2px rgba(0, 0, 0, 0.08);
  background-color: white;
  display: grid;
  grid-template: "........." 2rem
                 "title-box" 4rem
                 "........." 1rem
                 "image-box" 15rem
                 "........." 2rem
                 "info-box"  30rem
}

.title-box{
  grid-area: title-box;
  border-bottom: 1px solid #eee;
}

.title{
  font-weight: bold;
  text-align: center;
}

.image-box{
  grid-area: image-box;
  display: grid;
  grid-template:"... file-input ... upload-box ..."
                /10% 30% auto 50% auto;
  position: relative;
  border-bottom: 1px solid #eee;
}

.file-input{
  grid-area: file-input;
  position: absolute;
  bottom: 0;
}

.upload-box{
  grid-area: upload-box;
  height: 14rem;
  width: 14rem;
  background-color:black;
  margin-left: 3rem;
}

.info-box{
  grid-area: info-box;
  display: grid;
  grid-template: "... info-form ..."
                 /auto 80% auto
}

.info-form{
  grid-area: info-form;
}

.register-btn{
  margin-top: 1rem;
  font-weight: bold;
}

</style>