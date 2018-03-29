<template>
  <section class="user-view">
  <div class="content">
    <div class="subsection">

    <ul style="list-style-type: none; padding: 0; margin: 0;">
      <li v-for="cart in carts" style="padding: 10px 20px; margin: 0 25px; position: relative;">
        Cart ID: {{ ' ' + cart.cart_id }}
      </li>
    </ul>

    </div>
  </div>
  </section>


</template>
<script>
import axios from '~/plugins/axios'

export default {
  async asyncData () {
    let { data } = await axios.get('/api/cart/all_items')
    console.log(data)
    return { carts: data }
  },

  head () {
    return {
      title: 'Items'
    }
  }
}
</script>

<style lang="stylus" scoped>
.user-view
  padding-top 0

.content
  position absolute
  width 100%

.subsection
  background-color #fff
  border-radius 2px
  margin 25px 0
  transition all .5s cubic-bezier(.55,0,.1,1)
  padding 10px 30px 10px 30px
  position relative
  line-height 20px
  .subsection-title
    margin 25px 10px
    font-size 26px
    font-weight 500
  .user-username
    font-size 24px
    font-weight 500
    color #707070
  .user-password
    font-size 24px
    font-weight 500
    color #707070
  a
    text-decoration underline
  &:hover
    color #515ec4

</style>
