# Welcome to INF-CO on rails 

## Intro

This is a RoR app used at LCSEE Systems to conduct infrastructure
checks (INF-CO). 

Operations Technicians' INF-CO includes checking printers, lab
machinces, request tracker functionallity, load balancers, and so on.
Internal Technicians' INF-CO involves validating backups, checking
server disk space, and keeping the machines in the office up-to-date
(reLOUDs).  These checks are necessary to be positive that our
infrastructure is performing as expected.

Entries for each check (ie - printers, labs, backups) are imported via
json files using a rake command (rake import) at deployment.  If
entries need to be added post-deployment techs can create entries from
the app itself.

Technicians will conduct their checks and report whether the check
passed or failed to this app.  If a check fails then the tech will
report a request tracker ticket number to the issue and a link to said
ticket will be generated.  INF-CO on rails is supported on mobile and
tablets devices as well.

#### *Note* 
The configs for devise and the mysql database have been
neutered so you will need to provide your own for this app to function
properly.



## Screenshots

![Alt text](/app/assets/images/internal_check.png "internal check")

====

![Alt text](/app/assets/images/admin_tools.png "admin tools")

====

![Alt text](/app/assets/images/LOUD_checks_index.png "loud checks")

====

![Alt text](/app/assets/images/schedule.png "schedule")

====

![Alt text](/app/assets/images/operations_checks_index.png "ops checks index")

====

![Alt text](/app/assets/images/operations_check.png "ops checks")

====

#### Mobile Screenshots

![Alt text](/app/assets/images/operations_check_mobile.png "ops mobile check")

====

![Alt text](/app/assets/images/internal_checks_mobile.png "internal mobile")

