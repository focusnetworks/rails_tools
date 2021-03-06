Rails Tools
===========

Here's my swiss-knife Rails helpers.

Usage
-----

### Less CSS

If you're using [Less CSS](http://lesscss.org), Rails Tools will automatically generate all files from `app/stylesheets/*.{css,less}` to `public/stylesheets` on development environment.

You can have partials (`_partial.less`) that will be merged by using the `@import` rule, but this will not generate a file on `public/stylesheets`.

	# app/stylesheets/main.less
	@import "_shared";

	* { margin: 0; padding: 0; }

All files `app/stylesheets/*.css` will be copied to `public/stylesheets`.

For production, you can use the rake task `rake less:generate`.

### dispatcher tag

If you're using <http://github.com/fnando/dispatcher-js>, this helper will create the meta tags.

	<%= dispatcher_tag %>

### body

Create the `body` tag setting some attributes:

	<%= body do %>
	<% end %>

Will be converted to

	<body id="sample-page" class="sample-index en">
	</body>

Set any attribute by providing a hash:

	<%= body :id => "foo", :class => "bar", :onload => "init();" do %>
	<% end %>

If you just want to append more classes, use the options `:append_class`:

	<%= body :append_class => do %>
	<% end %>

### page title

Set the page title in a clean way.

	class SampleController < ApplicationController
	  def index
	    # set a custom page title
	    set_page_title "My page title"

	    # set attributes for I18n interpolation.
	    # the scope is titles.controller.action.
	    set_page_title :name => "John Doe"
	  end
	end

	# On your view, you can do.
	# This will lookup for strings, I18n scope and defaults to
	# "#{controller_name} #{action_name}".titleize
	<%= page_title %>

### flash_messages

Display all flash messages in `<p class="message #{type}"></p>` tags.
So if you set messages like

	flash[:notice] = "Notice"

you can add this to your view

	<%= flash_messages %>

and the helper will output

	<p class="message notice">Notice</p>

### Block wrappers

Just hiding some HTML.

	<%= main do %>
		<!-- Wrap the content into a div#main tag -->
	<% end %>

	<%= sidebar do %>
		<!-- Wrap the content into a div#sidebar tag -->
	<% end %>

There's also `page`, `header` and `footer` wrappers. You can set other attributes, like CSS classes:

	<%= main :class => "rounded" do %>
	<% end %>

### Assets (JavaScripts & Stylesheets)

There are two helpers that merge files like Assets Packager.

	<%= javascript_includes :base %>
	<%= stylesheet_includes :base %>

You need to create a `config/assets.yml` file like this:

	javascripts:
	  base:
	    - jquery
	    - rails
	    - application
	stylesheets:
	  base:
	    - reset

To merge files, you have to run a rake task:

	$ rake assets:merge

### Fieldset

A fieldset helper with I18n support.

  <%= fieldset "labels.user.create" do %>
	<!-- Some html -->
  <% end %>

To-Do
-----

* Move more helpers over this plugin

Maintainer
----------

* Nando Vieira (<http://simplesideias.com.br>)

License:
--------

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.