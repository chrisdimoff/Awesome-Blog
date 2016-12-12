
page_hash = {}
for i in 1..10


page_hash["@page#{i}"] = i

end


<nav class="navbar">
     <div id="links">
       <%= link_to 'Home', root_path %> |
       <%= link_to 'About', about_path %> |
       <%= link_to 'All Posts', posts_path %>
       <div class='pull-right'>
         <% if session[:user_id].present? %>
            Hello <%= current_user.first_name %> |
            <%= link_to 'Update User Info', edit_users_path%> |
            <%= link_to 'Sign Out', sessions_path, method: :delete %> |
            <%= link_to 'Favourites', users_path %> |
            <%= link_to 'New Post', new_post_path %>
         <% else %>
            <%= link_to 'Sign Up', new_user_path %> |
            <%= link_to 'Sign In', new_session_path %> |
            <%= link_to "Sign in with Google", sign_in_with_google_path, id: "sign_in" %> |
            <%= link_to "Sign in with Facebook", sign_in_with_facebook_path, id: "sign_in" %>
          <% end %>
      </div>
    </div>
   </nav>
