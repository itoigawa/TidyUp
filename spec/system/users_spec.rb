require 'rails_helper'
RSpec.describe "ユーザー機能", type: :system do
  let(:user) { create(:user) }

  # it 'ユーザー登録ページで各フィールドを入力して「登録」をクリックしたらユーザーが登録されている' do
  #   visit '/register'
  #   within '#register-form' do
  #     fill_in 'email', with: 'test@example.com'
  #     fill_in 'password', with: 'password'
  #     fill_in 'password_confirmation', with: 'password'
  #     click_on '登録'
  #   end
  #   expect(page).to have_current_path('/login'), 'ログインページに遷移できていません'
  # end

  it '登録済みユーザーでログインできる' do
    visit '/login'
    within "#login-form" do
      fill_in 'email', with: user.email
      fill_in 'password', with: '12345678'
      click_on 'ログイン'
    end
    expect(page).to have_current_path('/items'), 'アイテムページに遷移できていません'
  end

  it 'ログイン状態でログアウトできる' do
    login_as(user)
    click_on 'menu'
    click_on 'Logout'
    expect(page).to have_current_path('/login'), 'ログインページに遷移できていません'
  end

  it '未ログイン状態でアイテムページに遷移したら、ログインページにリダイレクトされる' do
    visit '/items'
    expect(page).to have_current_path('/login'), 'ログインページに遷移できていません'
  end

  it 'ログイン状態でアイテムページに遷移したら、アイテムページが表示される' do
    login_as(user)
    visit '/items'
    expect(page).to have_current_path('/items'), 'アイテムページに遷移できていません'
  end

  it 'ユーザー登録フォームでバリデーションが機能していること' do
    visit '/register'
    within '#register-form' do
      # fill_in 'email', with: ''
      # expect(page).to have_content('メールアドレスは必須項目です'), '必須チェックのバリデーションエラーが表示されていません'
      fill_in 'email', with: 'password'
      expect(page).to have_content('メールアドレスの形式で入力してください'), 'フォーマットのバリデーションエラーが表示されていません'
      fill_in 'password', with: ''
      expect(page).to have_content('パスワードは必須項目です'), '必須チェックのバリデーションエラーが表示されていません'
      fill_in 'password', with: 'aaaaaaa'
      expect(page).to have_content('パスワードは8文字以上で入力してください'), '文字数チェックのバリデーションエラーが表示されていません'
      fill_in 'password_confirmation', with: ''
      expect(page).to have_content('パスワード（確認）は必須項目です'), '必須チェックのバリデーションエラーが表示されていません'
      fill_in 'password_confirmation', with: 'aaaaaaa'
      expect(page).to have_content('パスワード（確認）は8文字以上で入力してください'), '文字数チェックのバリデーションエラーが表示されていません'
      click_on '登録'
    end
    expect(page).to have_current_path('/register'), 'バリデーションエラーが発生しているときに画面遷移してはいけません'
  end

  it 'ログインフォームでバリデーションエラーが機能していること' do
    visit '/login'
    within '#login-form' do
      fill_in 'email', with: ' '
      expect(page).to have_content('メールアドレスは必須項目です'), '必須チェックのバリデーションエラーが表示されていません'
      fill_in 'email', with: 'password'
      expect(page).to have_content('メールアドレスの形式で入力してください'), 'フォーマットのバリデーションエラーが表示されていません'
      fill_in 'password', with: ' '
      expect(page).to have_content('パスワードは必須項目です'), '必須チェックのバリデーションエラーが表示されていません'
      fill_in 'password', with: 'aaaaaaa'
      expect(page).to have_content('パスワードは8文字以上で入力してください'), '文字数チェックのバリデーションエラーが表示されていません'
      click_on 'ログイン'
    end
    expect(page).to have_current_path('/login'), 'バリデーションエラーが発生しているときに画面遷移してはいけません'
  end

end
