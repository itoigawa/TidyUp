<template>
<div class="form-wrapper">
  <div class="form-card">
    <div class="login">ログイン</div>
      <ValidationObserver class="form-input" v-slot="{ handleSubmit }">
        <form>
        <ValidationProvider
          name="メールアドレス"
          rules="required|email"
          v-slot="{ errors }">
          <v-text-field
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
            v-model="user.password"
            :error-messages="errors"
            label="パスワード"
            required
            :append-icon="show3 ? 'mdi-eye' : 'mdi-eye-off'"
            :type="show3 ? 'text' : 'password'"
            @click:append="show3 = !show3"
          ></v-text-field>
        </ValidationProvider>
          <v-btn width="22%" color="primary"  @click="handleSubmit(login)">ログイン</v-btn>
          <v-btn width="18%" color="red" dark @click="clear">消去</v-btn>
      </form>
    </ValidationObserver>
    <div class="test-login">
      <v-btn color="warning" @click="testLogin">
        お試しログイン
        <v-icon right dark>mdi-account-check</v-icon>
      </v-btn>
    </div>
    <div class="register-link">
      <router-link to="register">
        登録はこちらから
      </router-link>
    </div>
  </div>
</div>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  name: "LoginIndex",
  data() {
    return {
      show3: false,
      user: {
        email: '',
        password: '',
      }
    }
  },

  methods: {
    ...mapActions("users", [
      "loginUser",
      "fetchUser"
    ]),
    async login() {
      try {
        await this.loginUser(this.user);
        this.$router.push({ name: 'ItemIndex' })
      } catch (error) {
        console.log(error);
      }
    },
    async testLogin() {
      try {
        this.user.email = 'test@example.com'
        this.user.password = 'TestPassword'
        await this.loginUser(this.user);
        this.$router.push({ name: 'ItemIndex' })
      } catch (error) {
        console.log(error);
      }
    },
    clear () {
      this.user.email = ''
      this.user.password = ''
      this.$refs.observer.reset()
    },
  },
}
</script>

<style scoped>
.form-wrapper{
  min-height: 100vh;
  display: grid;
  grid-template:"....  ............  ...." auto
                "....  form-card     ...." 55%
                "....  ............  ...." auto
                / auto  40% auto
}

.form-card{
  grid-area: form-card;
  display: grid;
  grid-template: "... ..... ............. ..." 11%
                 "... login login         ..." 12%
                 "... ..... ............. ..." 2%
                 "... ..... form-input    ..." 48%
                 "... ..... ............. ..." 1%
                 "... ..... test-login    ..." 12%
                 "... ..... ............. ..." 2%
                 "... ..... register-link ..." 12%
                 /12%  1%   74%           13%;
  border-top: 4px solid#bf0000;;
  border-radius: 3px;
  background-color:white ;
  box-shadow: 0 7px 10px 2px rgba(0, 0, 0, 0.08);
}

.login{
  grid-area: login;
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

.test-login{
  grid-area: test-login;
  text-align: center;
}

.register-link{
  grid-area: register-link;
  text-align: center;
  font-weight: bold;
}

@media screen and (max-width: 1050px) {
  .form-wrapper{
    grid-template:"... ......... ..." auto
                  "... form-card ..." 65%
                  "... ......... ..." auto
                  /auto 90% auto
  }
}
</style>