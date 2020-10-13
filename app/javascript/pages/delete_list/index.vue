<template v-if="isAuthUserItem">
<div class="wrapper">
  <ItemHeader
    @all-items-list="handleShowAllItemsList"
    @tops-list="handleShowTopsList"
    @outor-list="handleShowOutorList"
    @pants-list="handleShowPantsList"
    @shoes-list="handleShowShoesList"
    />
  <template v-if="isVisibleAllItems">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      @delete-item="handleDeleteItem"
      :items="allItems"
      />
  </template>
  <template v-if="isVisibleTops">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      @delete-item="handleDeleteItem"
      :items="tops"
      />
  </template>
  <template v-if="isVisibleOutor">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      @delete-item="handleDeleteItem"
      :items="outor"
      />
  </template>
  <template v-if="isVisiblePants">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      @delete-item="handleDeleteItem"
      :items="pants"
      />
  </template>
  <template v-if="isVisibleShoes">
    <ItemList
      @detail-item="handleShowItemDetailModal"
      @delete-item="handleDeleteItem"
      :items="shoes"
      />
  </template>
  <modal name="item-detail-modal"
         :adaptive="true"
         height="auto">
    <ItemDetailModal
      v-if="isVisibleItemDetailModal"
      :item="itemDetail"
      @close-modal="handleCloseItemDetailModal"
      />
  </modal>
  <modal name="congratulations-modal"
         :adaptive="true"
         height="auto">
    <CongratulationsModal
      v-if="isVisibleCongratulationsModal"
      @close-modal="handleCloseCongratulationsModal"
      />
  </modal>
  <TheFooter/>
</div>
</template>

<script>
import axios from '../../plugins/axios'
import { mapGetters, mapActions } from 'vuex'
import ItemHeader from './components/ItemHeader'
import ItemList from './components/ItemList'
import ItemDetailModal from './components/ItemDetailModal'
import CongratulationsModal from './components/CongratulationsModal'
import TheFooter from 'components/shared/TheFooter'

export default {
  name: 'DeleteListIndex',
  components: {
    ItemHeader,
    ItemList,
    ItemDetailModal,
    CongratulationsModal,
    TheFooter
  },
  data() {
    return {
      itemDetail: {},
      isVisibleItemDetailModal: false,
      isVisibleCongratulationsModal: false,
      isVisibleAllItems: true,
      isVisibleTops: false,
      isVisibleOutor: false,
      isVisiblePants: false,
      isVisibleShoes: false
    }
  },
  computed: {
    ...mapGetters('items', ['items']),
    allItems() {
      return this.items
    },
    tops() {
      return this.items.filter(item => {
        return item.category =='トップス'
      })
    },
    outor() {
      return this.items.filter(item => {
        return item.category == 'アウター'
      })
    },
    pants() {
      return this.items.filter(item => {
        return item.category == 'パンツ'
      })
    },
    shoes() {
      return this.items.filter(item => {
        return item.category == 'シューズ'
      })
    },
    isAuthUserItem() {
      return this.item.user_id == this.authUser.itemDetail
    },
  },
  created(){
    this.fetchNotWearingItems();
  },
  methods: {
    ...mapActions(
      'items',
      [
        'deleteItem',
        'fetchNotWearingItems'
      ]),
    handleShowItemDetailModal(item) {
      this.isVisibleItemDetailModal = true;
      this.itemDetail = item;
      this.$modal.show('item-detail-modal');
    },
    handleCloseItemDetailModal() {
      this.isVisibleItemDetailModal = false;
      this.$modal.hide('item-detail-modal');
    },
    handleShowCongratulationsModal() {
      this.isVisibleCongratulationsModal = true;
      this.$modal.show('congratulations-modal');
    },
    handleCloseCongratulationsModal() {
      this.isVisibleCongratulationsModal = false;
      this.$modal.close('congratulations-modal');
    },
    handleShowAllItemsList() {
      this.isVisibleAllItems = true;
      this.isVisibleTops = false;
      this.isVisibleOutor  = false;
      this.isVisiblePants = false;
      this.isVisibleShoes = false;
    },
    handleShowTopsList() {
      this.isVisibleAllItems = false;
      this.isVisibleTops = true;
      this.isVisibleOutor = false;
      this.isVisiblePants = false;
      this.isVisibleShoes = false;
    },
    handleShowOutorList() {
      this.isVisibleAllItems = false;
      this.isVisibleTops = false;
      this.isVisibleOutor = true;
      this.isVisiblePants = false;
      this.isVisibleShoes = false;
    },
    handleShowPantsList() {
      this.isVisibleAllItems = false;
      this.isVisibleTops = false;
      this.isVisibleOutor = false;
      this.isVisiblePants = true;
      this.isVisibleShoes = false;
    },
    handleShowShoesList() {
      this.isVisibleAllItems = false;
      this.isVisibleTops = false;
      this.isVisibleOutor = false;
      this.isVisiblePants = false;
      this.isVisibleShoes = true;
    },
    async handleDeleteItem(item) {
      const deleteItem = confirm('アイテムを削除しますか？');
      try {
        if( deleteItem == true ) {
          await this.deleteItem(item);
          this.handleShowCongratulationsModal();
        }
      } catch (error) {
        console.log(error);
      }
    }
  }
}
</script>

<style scoped>
.wrapper{
  background-color:lightgray;
}
</style>
