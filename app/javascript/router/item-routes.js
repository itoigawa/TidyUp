import Item from 'components/item/Item'
import ItemShow from 'components/item/Show'

export default {
  path: '', 
  component: Item,
  children: [
    {
      path: '/items/:id',
      component: ItemShow
    }
  ]
}