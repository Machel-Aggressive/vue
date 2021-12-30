import Vue from 'vue'
import App from './App.vue'
// import ElementUI from 'element-ui';
// import 'element-ui/lib/theme-chalk/index.css';
import { Button,Row,DatePicker } from 'element-ui'
import './assets/reset.css'

Vue.config.productionTip = false

Vue.component(Button.name, Button)
Vue.component(Row.name, Row)
Vue.component(DatePicker.name, DatePicker)
// Vue.use(ElementUI);

new Vue({
  render: h => h(App),
}).$mount('#app')
