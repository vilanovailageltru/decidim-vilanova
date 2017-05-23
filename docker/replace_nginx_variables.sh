#!/bin/sh
envsubst < /etc/nginx/sites-enabled/decidim-vilanova.conf > /etc/nginx/sites-enabled/decidim-vilanova-overriden.conf
mv /etc/nginx/sites-enabled/decidim-vilanova-overriden.conf /etc/nginx/sites-enabled/decidim-vilanova.conf