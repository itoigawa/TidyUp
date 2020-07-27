import User from 'components/user/User'
import New from 'components/user/New'

export default {
  path: '/users',
  component: User,
  children: [
    {
      path: 'new',
      component: New
    },
  ]
}