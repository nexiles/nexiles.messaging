######################################################################
# project - file.coffee
#
# (c) 2011 nexiles GmbH.
# All rights reserved.

app = window.app
MessageModel = window.MessageModel

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

        app.models.message = new MessageModel()

    about: ->
        console.log "route about"
        @activate "about"

    contact: ->
        console.log "route contact"
        @activate "contact"

# vim: set ts=4 sw=4 expandtab:
