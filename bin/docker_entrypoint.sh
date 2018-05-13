#! /bin/sh
#
# docker_entrypoint.sh
# Copyright (C) 2018 jalance <jalance@Anduril.local>
#
# Distributed under terms of the MIT license.
#


rake db:migrate 2>/dev/null || rake db:setup 

foreman start
