<template>
  <div id="app">
    <h1>To do list</h1>
    <todo-form @todo-added="addTodo"></todo-form>
    <ul>
      <li v-for="item in todoItemList" :key="item.id">
        <todo-item :label="item.label" :done="item.done"></todo-item>
      </li>
    </ul>
  </div>
</template>

<script>
import TodoItem from './components/TodoItem.vue'
import TodoForm from './components/TodoForm.vue'
import uniqueId from 'lodash.uniqueid'
export default {
  name: 'App',
  components: {
    TodoItem,
    TodoForm
  },
  data() {
    return {
      todoItemList: [
        { id: uniqueId('todo-'), label: 'Learn Vue', done: false },
        { id: uniqueId('todo-'), label: 'Create a Vue project with the CLI', done: true },
        { id: uniqueId('todo-'), label: 'Have fun', done: true },
        { id: uniqueId('todo-'), label: 'Create a to-do list', done: false }
      ]
    }
  },
  methods: {
    addTodo(todoLabel) {
      console.log('Todo added: ', todoLabel);
      this.todoItemList.push({id: uniqueId('todo-'), label: todoLabel, done: false});
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
