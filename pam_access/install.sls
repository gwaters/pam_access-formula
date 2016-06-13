# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "pam_access/map.jinja" import pam_access with context %}

pam_access-pkg:
  pkg.installed:
    - name: {{ pam_access.pkg }}
