try 
  {Robot,Adapter,TextMessage,User} = require 'hubot' 
catch 
  prequire = require('parent-require') 
  {Robot,Adapter,TextMessage,User} = prequire 'hubot'

class QQPlus extends Adapter

  constructor: ->
    # @robot.logger.info "Constructor"
    super


  send: (envelope, strings...) ->
    @robot.logger.info "Send"

  reply: (envelope, strings...) ->
    @robot.logger.info "Reply"

  run: ->
    @robot.logger.info "Run"
    @emit "connected"
    user = new User 1001, name: 'Sample User'
    message = new TextMessage user, 'hubot: help', 'MSG-001'
    @robot.receive message

    self = this
    setTimeout ()->
      self.robot.receive message
      self.robot.logger.info "Run"
    , 1000


exports.use = (robot) ->
  new QQPlus robot