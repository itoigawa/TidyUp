import Item from 'components/item/Item'
import ItemNew from 'components/item/New'
import ItemShow from 'components/item/Show'

export default {
  path: '', 
  component: Item,
  children: [
    {
      path: 'items/new',
      component: ItemNew
    },
    {
      path: '/items/:id',
      component: ItemShow
    }
  ]
}