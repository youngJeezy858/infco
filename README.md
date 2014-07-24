== Welcome to INF-CO on rails 

==== Intro

This is a RoR app used at LCSEE Systems to conduct infrastructure
checks (INF-CO). 

Operations Technicians' INF-CO includes checking printers, lab
machinces, request tracker functionallity, load balancers, and so on.
Internal Technicians' INF-CO involves validating backups, checking
server disk space, and keeping the machines in the office up-to-date
(reLOUDs).  These checks are necessary to be positive that our
infrastructure is performing as expected.

Entries for each check (ie - printers, labs, backups) are entered via
the admin tools tab.

Technicians will conduct their checks and report whether the check
passed or failed to this app.  INF-CO on rails is supported on mobile
and tablets devices as well.


==== Setting up the dev environment on Ubuntu

NOTE: You will need to have a functioning LDAP for the app to work
correctly on production. The Github version of this app has all the
LDAP functionallity commented out since most people don't have a
working LDAP server handy.

1. You will need these 4 packages

```
$ sudo apt-get install ruby-rails-3.2 mysql-server mysql-client libmysqlclient-dev
```

2. Provision the DB

$ mysql

```
> create database infco_dev;
> grant all on infco_dev.* to root@localhost identified by '[password]';
> flush privileges;
> exit
```

3. Edit DB configs from app's base dir

```
$ cp doc/database.yml config/
$ emacs config/database.yml
```

- insert the password you chose from step 2

4. Install gems and populate DB 

```
$ bundle install
$ rake db:migrate
```

5. Start server

```
$ rails s
```

6. View from web browser at localhost:3000 