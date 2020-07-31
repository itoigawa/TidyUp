<template>
<div class="form-wrapper">
  <div class="form-card">
    <div class="register">ユーザー登録</div>
    <form>
      <v-text-field
        v-model="email"
        :error-messages="emailErrors"
        label="メールアドレス"
        required
        @input="$v.email.$touch()"
        @blur="$v.email.$touch()"
      ></v-text-field>
      <v-text-field
        v-model="password"
        :error-messages="passwordErrors"
        label="パスワード"
        required
        @input="$v.password.$touch()"
        @blur="$v.password.$touch()"
      ></v-text-field>
      <v-btn width="16%" color="primary"  @click="submit">登録</v-btn>
        <v-btn width="16%" color="red" dark @click="clear">消去</v-btn>
      <div class="login-link">
        <router-link to="/login">ログインはこちらから</router-link>
      </div>
    </form>
  </div>
</div>

  
</template>

<script>
  import { validationMixin } from 'vuelidate'
  import { required, minLength, email } from 'vuelidate/lib/validators'

  export default {
    mixins: [validationMixin],

    validations: {
      email: { required, email },
      password: { required, minLength: minLength(3) },
      checkbox: {
        checked (val) {
          return val
        },
      },
    },

    data: () => ({
      email: '',
      password: '',
      select: null,
      checkbox: false,
    }),

    computed: {
      emailErrors () {
        const errors = []
        if (!this.$v.email.$dirty) return errors
        !this.$v.email.email && errors.push('有効なメールアドレスを入力してください')
        !this.$v.email.required && errors.push('メールアドレスを入力してください')
        return errors
      },
      passwordErrors () {
        const errors = []
        if (!this.$v.password.$dirty) return errors
        !this.$v.password.minLength && errors.push('3文字以上のパスワードを入力してください')
        !this.$v.password.required && errors.push('パスワードを入力してください')
        return errors
      },
    },

    methods: {
      submit () {
        this.$v.$touch()
      },
      clear () {
        this.$v.$reset()
        this.email = ''
        this.password = ''
        this.checkbox = false
      },
    },
  }
</script>

<style scoped>
.form-wrapper{
  background-color: #f7f7f7;
  min-width: 100vh;
  min-height: 100vh;
  display: grid;
  grid-template:"....  ........   ...." 15%
                "....  register   ...." 8%
                "....  form-card  ...." 54%
                "....  login-link  ...."  8%
                "....  .........  ...."  15%
                / 30%  40% 30%
}

.form-card{
  border-top: 4px solid #18ebfa;
  border-radius: 3px;
  background-color:white ;
  grid-area: form-card;
  box-shadow: 0 7px 10px 2px rgba(0, 0, 0, 0.08);
}

.register{
  grid-area: register;
  font-size: 2rem;
  font-weight: bold;
  color: #4d4d4d;
  margin-top: 3rem;
  margin-bottom: 1.5rem;
  margin-left: 4rem;
}

form{
  margin-left: 4rem;
  height: 50%;
  width: 70%;
  text-align: center;
}

.v-btn{
  margin-top: 2rem;
  margin-left: 2rem;
}

.login-link{
  grid-area: login-link;
  margin-top: 2rem;
  margin-left: 2rem;
}
</style>