import Vue from 'vue'
import {
  ValidationProvider,
  ValidationObserver,
  extend,
} from 'vee-validate'
import {
  email,
  required,
  image,
  confirmed,
  numeric
} from 'vee-validate/dist/rules';

Vue.component('ValidationObserver', ValidationObserver)
Vue.component('ValidationProvider', ValidationProvider)

extend('email', {
  ...email,
  message: '{_field_}の形式で入力してください'
});

extend('required', {
  ...required,
  message: '{_field_}は必須項目です'
});

// extend('confirmed', {
//   ...confirmed,
//   message: 'パスワードと一致しません'
// });

extend('image', {
  ...image,
  message: '{_field_}は画像形式で入力してください'
});

extend('numeric', {
  ...numeric,
  message: '{_field_}は半角数値で入力してください'
});

extend('min', {
  validate(value, { length }) {
    return value.length >= length;
  },
  params: ['length'],
  message: '{_field_}は{length}文字以上で入力してください'
});

extend('max', {
  validate(value, { length }) {
    return value.length <= length;
  },
  params: ['length'],
  message: '{_field_}は{length}文字以下で入力してください'
});
