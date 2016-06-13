###############################
# Salt Formula for Pam_Access #
###############################
# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "pam_access/map.jinja" import pam_access with context %}

include:
  - pam_access.install

# Pam Access Configuration
pam_access-file:
  file.managed:
    - name: {{ pam_access.conf_file }}
    - source: salt://pam_access/files/access.conf
    - template: jinja
    - defaults:
        allowed_users: {{ salt['pillar.get']('pam_access:allowed_users', {})}}
        denied_users: {{ salt['pillar.get']('pam_access:denied_users', {})}}
