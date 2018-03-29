<template>
  <section class="user-view">
  <div class="content">
    <div class="subsection">
    <form style="margin: 15px 15px;">
      <div style="margin: 10px 0;">
        <span class="customer-fname">Enter Name: </span>
        <input type="text" :value="fname" v-model="fname"></input>
        <br>Columns available:
        <br>
        <br>
        <input  type="checkbox" v-model="customer_id">Customer ID<br>
        <input  type="checkbox" v-model="name">Name<br>
        <input  type="checkbox" v-model="phone">Phone<br>
        <input  type="checkbox" v-model="email">Email<br>
        <input  type="checkbox" v-model="credit_card">Credit Card<br>
        <input  type="checkbox" v-model="address">Address<br>
      </div>
    </form>
    <button type="button" class="button--grey" @click="submitSearch">Search Customer</button>

    <ul style="list-style-type: none; padding: 0; margin: 0;">
      <li v-for="customer in customers" style="padding: 10px 20px; margin: 0 25px; position: relative;">
        <template v-if="customer.customer_id">
          {{ customer.customer_id }}
        </template>
        <template v-if="customer.name">
          {{ customer.name }}
        </template>
        <template v-if="customer.phone">
          {{ customer.phone }}
        </template>
        <template v-if="customer.email">
          {{ customer.email }}
        </template>
        <template v-if="customer.creditcard">
          {{ customer.creditcard }}
        </template>
        <template v-if="customer.address">
          {{ customer.address }}
        </template>
      </li>
    </ul>

    </div>
  </div>
  </section>


</template>
<script>
import axios from '~/plugins/axios'

export default {

  data () {
    return {
      customers: '',
      fname: 'Search',
      name: false
    }
  },

  // async asyncData () {
  //   let { data } = await axios.get('/api/customers/name')
  //   return { customers: data }
  // },

  methods: {
    submitSearch () {
      let self = this
      let values = ''
      if (self.customer_id) {
        values = values + 'customer_id,'
      }
      if (self.name) {
        values = values + 'name,'
      }
      if (self.email) {
        values = values + 'email,'
      }
      if (self.phone) {
        values = values + 'phone,'
      }
      if (self.address) {
        values = values + 'address,'
      }
      if (self.credit_card) {
        values = values + 'creditcard,'
      }
      console.log(values.substring(0, values.length - 1))
      axios.post('/api/customers/name', {
        headers:
          {
            'Content-Type': 'application/json'
          },
        data:
        {
          name: self.fname,
          options: values.substring(0, values.length - 1)
        }})
        .then((res) => {
          // res.data should contain the url for redirecting... bad practice
          this.customers = (res.data)
          console.log(this.customers)
        })
        .catch((e) => {
          console.log(e)
        })
    }
  },

  head () {
    return {
      title: `Search`
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
