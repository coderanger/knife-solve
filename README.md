knife-solve
===========

knife-solve is a little knife plugin to see the chef-server version solver
solution for a given set of cookbooks.

```bash
$ knife solve -E production apache2
Solving [apache2] in production environment
apache2 1.9.6
iptables 0.12.0
logrotate 1.5.0
pacman 1.1.1
```

Installation
------------

As with all knife plugins, just install the gem:

```
gem install knife-solve
```

Usage
-----

To solve a simple list of cookbooks:

```
knife solve apache2 mysql
```

You can also solve a normal run list:

```
knife solve 'role[www]'
```

Or use an existing node's run list:

```
knife solve -n www01
```
