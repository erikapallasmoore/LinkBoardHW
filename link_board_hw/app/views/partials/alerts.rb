<% flash.each do |type, msg| %>
<div class="alert alert-<%= type %>"><%= msg %></div>
<% end %>