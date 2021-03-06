// app/routes/tasks/new.js
import Ember from 'ember';

export default Ember.Route.extend({

  model() {
    return this.store.createRecord('task');
  },

  actions: {

    saveTask(newTask) {
      newTask.save().then(() => this.transitionTo('tasks'));
    },

    willTransition() {
      // rollbackAttributes() removes the record from the store
      // if the model 'isNew'
      this.controller.get('model').rollbackAttributes();
    }
  }
});
