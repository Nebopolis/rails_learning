import DS from 'ember-data';

export default DS.Model.extend({
  body: DS.attr('string'),
  complete: DS.attr('boolean')
});
