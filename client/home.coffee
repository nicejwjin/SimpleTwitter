Router.route '/', ->
  this.render 'home'

Template.home.helpers
  twits: ->
    CollectionTwits.find()
  email: ->
    Meteor.users.findOne(_id: @user._id)?.emails[0].address

Template.home.events
  'click #submit': (evt, tmpl) ->
    evt.preventDefault()
    CollectionTwits.insert
      user: Meteor.user()
      twit: $('#inpTwit').val()
    $('#inpTwit').val('')

  'click #inpTwit': (evt, tmpl) ->
    if $(evt).which is 13
      $('#submit').trigger('click')

