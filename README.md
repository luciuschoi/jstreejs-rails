# Jstreejs::Rails

This gem was built for the assets of Ruby on Rails projects.

[![Gem Version](https://badge.fury.io/rb/jstreejs-rails.svg)](https://badge.fury.io/rb/jstreejs-rails)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jquery-rails'
gem 'jstreejs-rails', '3.3.5.0'
gem 'ancestry'
```

And then execute:

```sh
$ bundle
```

## Usage

**application.css**

```css
/*
 *= require jstree/default/style.min
 *= require_tree .
 *= require_self
*/
```
or **application.scss**

```scss
@import 'jstree/default/style.min'
```

**application.js**

```js
//= require jquery
//= require jquery_ujs
//= require jstree.min
//= require jstree_init
//= require turbolinks
//= require_tree .
```

**jstree_init.coffee**

```coffeescript
$(document).on 'turbolinks:load', ->
  $('#tree').jstree 
    'core':
      'themes': 'name': 'default-dark'
      "check_callback": true  
      'data':
        'url': '/categories.json'
        'data': (node) ->
          { 'id': node.id }
    'plugins' : ['sort', 'dnd']
    'sort': (a, b) ->
      a1 = @get_node(a)
      b1 = @get_node(b)
      if a1.icon == b1.icon
        if a1.text > b1.text then 1 else -1
      else
        if a1.icon > b1.icon then 1 else -1
  return

$(document).on 'dnd_stop.vakata', (e, data) ->
  ref = $('#tree').jstree(true)
  parents = ref.get_node(data.element).parent
  alert parents
  return  
```  

**categories_controller.rb**

```rb
class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = if request.xhr?
                    Category.all
                  else
                    Category.roots.order(ancestry: :desc)
                  end
  end

···  
```

**_category.json.jbuilder** 

```json
json.id category.id
json.text category.title
json.parent category.root? ? "#" : category.ancestry.split("/").last
```

**index.html**

```html
<div id='tree'></div>
```

![](vendor/assets/images/screen_capture.png)


### Themes

Two themes were included by default: `default` and `default-dark`.

To change the theme from  `default` to `default-dark`, you should update two code lines as follows:

**application.css**

```css
 *= require jstree/default-dark/style.min
···
```

**jstree-init.coffee**

```coffeescript
$(document).on 'turbolinks:load', ->
  $('#tree').jstree 'core':
    'themes':
      'name': 'default-dark'
      ···
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/luciuschoi/jstreejs-rails.
