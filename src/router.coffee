######################################################################
# project - file.coffee
#
# (c) 2011 nexiles GmbH.
# All rights reserved.

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

    about: ->
        console.log "route about"
        @activate "about"

    contact: ->
        console.log "route contact"
        @activate "contact"

# vim: set ts=4 sw=4 expandtab:
