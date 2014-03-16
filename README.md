# A Chef Cookbook to install Emacs from source

support CentOS 6

## Attributes

default attributes are:

```ruby
default['emacs']['version'] = '24.3'
default['emacs']['prefix'] = '/usr/local'
default['emacs']['url'] = 'ftp://ftp.ring.gr.jp/pub/GNU/emacs/'
```

you can override them in your json file
