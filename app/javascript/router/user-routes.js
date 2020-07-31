import User from 'components/user/User'
import UserNew from 'components/user/New'

export default {
  path: '/users',
  component: User,
  children: [
    {
      path: 'new',
      component: UserNew
    },
  ]
}