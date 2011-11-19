==========================
Projekt: nexiles.messaging
==========================

:Author:        Stefan Eletzhofer
:Date:          2011-11-19
:Version:       0.1dev
:Tags:          rabbitmq messaging javascript jsonrpc


Abstract
========

test project to explore ways to communicate with rabbitmq using javascript

Goals
=====

- explore ways to get hold on messages from abbitmq in the browser using the
  rabbitmq jsonrpc plugin

- needs to be async

- needs to work across browsers -- even on IE 7

Todo
=====

[X]  basic message delivery
[X]  backbone model for message
[X]  backbone collection for messages
[ ]  backbone view for messages

Notes
=====

Apache configuration
--------------------

The rpc of RabbitMQ needs to be proxied through the same domain
because of Same Origin Access Policies.  See `vhosts.conf` for a working,
very basic example.

On my OSX Lion box it's just a matter of adding the `vhosts.conf` file
to `/etc/apache2/other` and then do a `sudo apachectl graceful`.

.. note::
    Be sure to change the paths in the `vhosts.conf` file!

changelog
=========

0.1 - unreleased
----------------

- added basic message delivery.


..  vim: set ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:
