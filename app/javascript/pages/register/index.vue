<template>
<div id="register-form" class="form-wrapper">
  <template v-if="isVisibleRegisterAlert">
    <div class="register-alert">
      <v-alert
        type="info"
      >
        ユーザー登録が完了しました
      </v-alert>
    </div>
  </template>
  <div class="form-card">
    <div class="register">ユーザー登録</div>
    <ValidationObserver class="form-input" v-slot="{ handleSubmit }">
      <form>
        <ValidationProvider
          name="メールアドレス"
          rules="required|email"
          v-slot="{ errors }">
            <v-text-field
              id="email"
              v-model="user.email"
              :error-messages="errors"
              label="メールアドレス"
              required
            ></v-text-field>
        </ValidationProvider>
        <ValidationProvider
          name="パスワード"
          rules="required|min:8"
          v-slot="{ errors }">
          <v-text-field
            ref="password"
            id="password"
            v-model="user.password"
            :error-messages="errors"
            label="パスワード"
            required
            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            :type="show1 ? 'text' : 'password'"
            @click:append="show1 = !show1"
          ></v-text-field>
        </ValidationProvider>
        <ValidationProvider
          name="パスワード（確認）"
          rules="required|min:8"
          v-slot="{ errors }">
          <v-text-field
            id="password_confirmation"
            v-model="user.password_confirmation"
            :error-messages="errors"
            label="パスワード（確認）"
            required
            :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
            :type="show2 ? 'text' : 'password'"
            @click:append="show2 = !show2"
          >
          </v-text-field>
        </ValidationProvider>
        <v-btn type="submit" width="18%" color="primary" @click="handleSubmit(register)">登録</v-btn>
        <v-btn width="18%" color="red" dark @click="clear">消去</v-btn>
      </form>
    </ValidationObserver>
    <div class="login-link">
      <router-link to="/login">ログインはこちらから</router-link>
    </div>
  </div>
</div>
</template>

<script>
export default {
  name: "RegisterIndex",
  data() {
    return {
      isVisibleRegisterAlert: false,
      show1: false,
      show2: false,
      user: {
        email: '',
        password: '',
        password_confirmation: ''
      }
    }
  },
  methods: {
    handleShowRegisterAlert(){
      this.isVisibleRegisterAlert = true;
    },
    register() {
      this.$axios.post('users', { user: this.user })
        .then(res => {
          this.handleShowRegisterAlert()
          // this.$router.push({ name: 'LoginIndex' })
        })
        .catch(err => {
          console.log(err)
        })
    },
    clear () {
      this.user.email = ''
      this.user.password = ''
      this.user.password_confirmation = ''
      this.$refs.observer.reset()
    },
  },
}
</script>

<style scoped>
.form-wrapper{
  min-height: 100vh;
  display: grid;
  grid-template:"....  .............  ...." 9%
                "....  register-alert ...." 7%
                "....  .............  ...." 9%
                "....  form-card      ...." 54%
                "....  .............  ...." 23%
                /auto  40% auto
}

.register-alert{
  grid-area: register-alert;
}

.form-card{
  grid-area: form-card;
  display: grid;
  grid-template: "... ..... ............. ..." 11%
                 "... register register         ..." 12%
                 "... ..... ............. ..." 2%
                 "... ..... form-input    ..." 60%
                 "... ..... ............. ..." 3%
                 "... ..... login-link ..." 10%
                 /12%  1%   74%           13%;;
  border-top: 4px solid #18ebfa;
  border-radius: 3px;
  background-color:white;
  box-shadow: 0 7px 10px 2px rgba(0, 0, 0, 0.08);
}

.register{
  grid-area: register;
  font-size: 2rem;
  font-weight: bold;
  color: #4d4d4d;
}

.form-input{
  grid-area: form-input;
  text-align: center;
}

.v-btn{
  margin-right: 1rem;
  margin-left: 1rem;
  font-weight: bold;
}

.login-link{
  grid-area: login-link;
  font-weight: bold;
  text-align: center;
}

@media screen and (max-width: 1050px) {
  .form-wrapper {
    grid-template:".... .............. ...." 6%
                  ".... register-alert ...." 4%
                  ".... .............. ...." 6%
                  ".... form-card      ...." 64%
                  ".... .............. ...." 16%
                  /auto 90% auto
  }
}
</style>