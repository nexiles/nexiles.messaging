######################################################################
# project - messaging.coffee
#
# (c) 2011 nexiles GmbH.
# All rights reserved.

JsonRpc  = window.JsonRpc
RabbitMQ = window.RabbitMQ

class window.MessageModel extends Backbone.Model
    initialize: ->
        console.log "MessageModel::initialize()"

        @broker_url = "http://127.0.0.1:55670/rpc/rabbitmq"

        @channel = null

        @channelFactory = new JsonRpc.Service @broker_url, @handle_service_ready,
            debug: true
            debugLogger: @log
            timeout: 30000

    handle_service_ready: ->
        logger.debug "MessageModel:handle_service_ready"
        @log "open"
        @channel = new RabbitMQ.Channel @channelFactory, @handle_channel_ready,
            debug: true
            debugLogger: @log
            channelTimeout: 5

    handle_channel_ready: ->
        logger.debug "MessageModel:handle_channel_ready"
        @log "channel=", @channel


    log: (msg) ->
        console.debug "MessageModel: ", msg
    
# vim: set ts=4 sw=4 expandtab:
