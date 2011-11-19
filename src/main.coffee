######################################################################
# nexiles.messaging - main.coffee
#
# (c) 2011 nexiles GmbH.
# All rights reserved.

# Application Namespaces
# ------------------------------------

window.app      = {}
app.routers     = {}
app.models      = {}
app.collections = {}
app.views       = {}

$(document).ready ->
    console.log "document.ready"

    app.initialize = ->
        console.log "app::initialize"

        app.routers.main = new window.MainRouter()
        app.routers.main.navigate 'home', true if Backbone.history.getFragment() is ''

    app.initialize()
    Backbone.history.start()

# vim: set ts=4 sw=4 expandtab:
