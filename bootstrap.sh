#!/bin/bash

a2ensite wordpress
a2enmod rewrite
service apache2 stop

apachectl -D FOREGROUND
