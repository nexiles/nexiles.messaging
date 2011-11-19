######################################################################
# nexiles.messaging - router.coffee
#
# (c) 2011 nexiles GmbH.
# All rights reserved.

app = window.app
MessagesCollection = window.MessagesCollection

class window.MainRouter extends Backbone.Router

    routes:
        "":                 "home"
        "home":             "home"
        "about":            "about"
        "contact":          "contact"

    activate: (what) ->
        $(".nav li").removeClass("active")
        $("##{what}-tab").addClass("active")

    home: ->
        console.log "route home"
        @activate "home"

        model = app.models.message = new MessagesCollection()
        model.bind "messages:queue_declared", (queue_name) =>
            console.log "ROUTER: queue declared:", queue_name
            #model.bind_and_consume()
        model.bind "messages:queue_bound", (queue_name) =>
            console.log "ROUTER: queue bound:", queue_name
        model.bind "add", (message) =>
            console.log "ROUTER: message:", message

    about: ->
        console.log "route about"
        @activate "about"

    contact: ->
        console.log "route contact"
        @activate "contact"

# vim: set ts=4 sw=4 expandtab:
