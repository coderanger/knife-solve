knife-solve
===========

knife-solve is a little knife plugin to see the chef-server version solver
solution for a given set of cookbooks.

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
knife solve -E production apache2 mysql
```

You can also solve a normal run list:

```
knife solve 'role[www]'
```

Or use an existing node's run list:

```
knife solve -n www01
```
