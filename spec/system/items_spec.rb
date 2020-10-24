require 'rails_helper'
RSpec.describe "Items", type: :system do
  let(:user) { create(:user) }
  before do
    login_as(user)
  end

  it '作成したアイテムがアイテムページに表示されている' do
    item = create(:item, user: user)
    expect(page).to_not have_selector('#item-create-modal'), 'アイテム作成モーダルが閉じられていません'
    expect(page).to have_selector("#item-#{item.id}"), '新規追加したアイテムが画面に表示されていません'
  end

  it 'アイテム編集モーダルで各フィールドの値を変更して更新ボタンを押すとその内容が反映される' do
    item = create(:item, user: user)
    find("#item-edit-#{item.id}").click
    within "#item-edit-modal-#{item.id}" do
      fill_in 'name', with: 'サンプル2'
      click_on '更新'
    end
    expect(page).to have_content('サンプル2'), '変更した商品名が表示されていません'
  end

  it 'アイテム追加モーダルでバリデーションが機能していること' do
    find('.exhibit_btn').click
    within '#item-create-modal' do
      fill_in 'name', with: ' '
      expect(page).to have_content('商品名は必須項目です'), '必須チェックのバリデーションエラーが表示されていません'
      fill_in 'name', with: 'a' * 13
      expect(page).to have_content('商品名は12文字以下で入力してください'), '文字数チェックのバリデーションエラーが表示されていません'
      click_on '登録'
      expect(page).to have_content('カテゴリーは必須項目です'), '必須チェックのバリデーションエラーが表示されていません'
      expect(page).to have_content('カラーは必須項目です'), '必須チェックのバリデーションエラーが表示されていません'
      expect(page).to have_content('シーンは必須項目です'), '必須チェックのバリデーションエラーが表示されていません'
    end
    expect(page).to have_selector('#item-create-modal'), 'バリデーションエラーが発生しているときに画面遷移してはいけません'
  end

  it 'アイテム編集モーダルでバリデーションが機能していること' do
    item = create(:item, user: user)
    find("#item-edit-#{item.id}").click
    within "#item-edit-modal-#{item.id}" do
      fill_in 'name', with: ' '
      expect(page).to have_content('商品名は必須項目です'), '必須チェックのバリデーションエラーが表示されていません'
      fill_in 'name', with: 'a' * 13
      expect(page).to have_content('商品名は12文字以下で入力してください'), '文字数チェックのバリデーションエラーが表示されていません'
      click_on '更新'
    end
    expect(page).to have_selector("#item-edit-modal-#{item.id}"), 'バリデーションエラーが発生しているときに画面遷移してはいけません'
  end

  it 'ヘッダーのカテゴリーで選択したアイテムが表示されている' do
    item1 = create(:item, name: 'トップス', category: 'トップス', user: user)
    item2 = create(:item, name: 'アウター', category: 'アウター', user: user)
    item3 = create(:item, name: 'パンツ', category: 'パンツ', user: user)
    item4 = create(:item, name: 'シューズ', category: 'シューズ', user: user)
    find('#all').click
    expect(page).to have_content('トップス'), '追加したアイテム(トップス)が表示されていません'
    expect(page).to have_content('アウター'), '追加したアイテム(アウター)が表示されていません'
    expect(page).to have_content('パンツ'), '追加したアイテム(パンツ)が表示されていません'
    expect(page).to have_content('シューズ'), '追加したアイテム(シューズ)が表示されていません'
    find('#tops').click
    expect(page).to have_content('トップス'), '追加したアイテム(トップス)が表示されていません'
    find('#outor').click
    expect(page).to have_content('アウター'), '追加したアイテム(アウター)が表示されていません'
    find('#pants').click
    expect(page).to have_content('パンツ'), '追加したアイテム(パンツ)が表示されていません'
    find('#shoes').click
    expect(page).to have_content('シューズ'), '追加したアイテム(シューズ)が表示されていません'
  end

  it 'アイテムの写真をクリックするとアイテム詳細モーダルが表示されている' do
    item = create(:item, user: user)
    find("#item-image-#{item.id}").click
    expect(page).to have_selector("#item-detail-modal-#{item.id}"), 'アイテム詳細モーダルが表示されていません'
  end
  
  # it 'カードの着用ボタンを押すと着用回数が増える' do
  # end

  # it 'カードの削除ボタンを押すとアイテムが削除される' do
  #   item = create(:item, user: user)
  #   find("#item-delete-#{item.id}").click
  #   page.driver.browser.switch_to.alert.accept
  #   expect(page).to_not have_selector("#item-#{item.id}"), 'アイテムが削除されていません'
  # end

  it '追加したアイテムがアイテムデータテーブルに表示されている' do
    item1 = create(:item, name: 'トップス', category: 'トップス', user: user)
    item2 = create(:item, name: 'アウター', category: 'アウター', user: user)
    item3 = create(:item, name: 'パンツ', category: 'パンツ', user: user)
    item4 = create(:item, name: 'シューズ', category: 'シューズ', user: user)
    find('#item-data-table').click
    expect(page).to have_content('トップス'), '追加したアイテム(トップス)が表示されていません'
    expect(page).to have_content('アウター'), '追加したアイテム(アウター)が表示されていません'
    expect(page).to have_content('パンツ'), '追加したアイテム(パンツ)が表示されていません'
    expect(page).to have_content('シューズ'), '追加したアイテム(シューズ)が表示されていません'
  end

  it 'アイテムデータテーブルで追加したアイテムの商品名検索が機能していること' do
    item1 = create(:item, name: 'トップス', category: 'トップス', user: user)
    item2 = create(:item, name: 'アウター', category: 'アウター', user: user)
    item3 = create(:item, name: 'パンツ', category: 'パンツ', user: user)
    item4 = create(:item, name: 'シューズ', category: 'シューズ', user: user)
    find('#item-data-table').click
    expect(Item.search('トップス')).to include(item1)
    expect(Item.search('アウター')).to include(item2)
    expect(Item.search('パンツ')).to include(item3)
    expect(Item.search('シューズ')).to include(item4)
  end

  it '着用していないアイテムが削除リストで表示されている' do
    item1 = create(:item, name: 'トップス', category: 'トップス', user: user)
    item2 = create(:item, name: 'アウター', category: 'アウター', user: user)
    item3 = create(:item, name: 'パンツ', category: 'パンツ', user: user)
    item4 = create(:item, name: 'シューズ', category: 'シューズ', user: user)
    find('#item-delete-list').click
    expect(page).to have_content('トップス'), '追加したアイテム(トップス)が表示されていません'
    expect(page).to have_content('アウター'), '追加したアイテム(アウター)が表示されていません'
    expect(page).to have_content('パンツ'), '追加したアイテム(パンツ)が表示されていません'
    expect(page).to have_content('シューズ'), '追加したアイテム(シューズ)が表示されていません'
  end

  it '削除リストでアイテムの削除が機能していること' do
    item = create(:item, user: user)
    find('#item-delete-list').click
    find("#item-delete-#{item.id}").click
    page.driver.browser.switch_to.alert.accept
    expect(page).to_not have_selector("#item-#{item.id}"), 'アイテムが削除されていません'
    expect(page).to have_content('Great！'), 'アイテム削除完了後のモーダルが表示されていません'
  end
end
