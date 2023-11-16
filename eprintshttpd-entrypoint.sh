#!/bin/bash

# ensure that the eprints user owns all files in the eprints directory
chown -R -c eprints.eprints /usr/share/eprints/

su -c "./usr/share/eprints/bin/generate_static pub" eprints # ensure that there are no broken links on the homepage
su -c "./usr/share/eprints/bin/epadmin update pub" eprints # ensure the admin user is added to the database
su -c "./usr/share/eprints/bin/epadmin reload pub" eprints # reload the archive's configuration

echo Restarting web server...
httpd -k restart -DFOREGROUND