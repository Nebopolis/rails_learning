// app/routes/tasks/index.js
import Ember from 'ember';

export default Ember.Route.extend({

  model() {
    return this.store.findAll('task');
  },

  actions: {
    saveTask(newTask) {
      newTask.save();
    },

    deleteTask(task) {
      let confirmation = confirm('Are you sure?');

      if (confirmation) {
        task.destroyRecord();
      }
    }
  }
});
