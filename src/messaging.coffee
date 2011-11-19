######################################################################
# project - messaging.coffee
#
# (c) 2011 nexiles GmbH.
# All rights reserved.

JsonRpc  = window.JsonRpc
RabbitMQ = window.RabbitMQ
JSON     = window.JSON

class window.MessageModel extends Backbone.Model
    defaults:
        contents: ""
        exchange: ""
        delivery_tag: null
        timestamp: null
        routing_key: null
        redelivered: no

class window.MessagesCollection extends Backbone.Collection
    model: window.MessageModel

    initialize: ->
        console.log "MessagesCollection::initialize()"

        @broker_url = "/rpc/rabbitmq"
        @exchange   = "nexiles.messaging"
        @queue      = null

        RabbitMQ.openChannel @onChannelOpen,
            debug: true
            debugLogger: @log

    onChannelOpen: (channel) =>
        console.debug "MessageModel:onChannelOpen: channel=", channel
        @channel = channel
        @trigger "messages:open", @channel
        deferred = channel.exchangeDeclare @exchange, "topic"
        deferred.addCallback(@onExchangeDeclared)

    onExchangeDeclared: (ex) =>
        console.log "MessageModel:onExchangeDeclared", ex
        @trigger "messages:exchange_declared", @exchange
        deferred = @channel.queueDeclare "", no, no, yes, yes
        deferred.addCallback(@onQueueDeclared)

    onQueueDeclared: (queue) =>
        console.log "MessageModel:onQueueDeclared queue_name=", queue
        @queue = queue
        @trigger "messages:queue_declared", @queue
        deferred = @channel.queueBind @queue, @exchange, "*"
        deferred.addCallback(@onQueueBound)

    onQueueBound: =>
        console.log "MessageModel:onQueueBound"
        @trigger "messages:queue_bound", @queue
        @channel.basicConsume @queue,
            {deliver: @deliver},
            {no_ack: true}

    deliver: (delivery) =>
        console.log "MessageModel:deliver", delivery
        @add delivery, {at: 0} # add new messages **ON TOP**
        @trigger "messages:received", delivery


    log: () ->
        console.debug "LOG: {{{"
        _.each(arguments, (item) ->
            if typeof(item) == 'string'
                console.debug item
            else
                console.debug JSON.stringify item
        )
        console.debug "LOG: }}}"
    
# vim: set ts=4 sw=4 expandtab:
