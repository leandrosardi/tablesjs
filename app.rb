get '/tablesjs', :agent => /(.*)/ do
    erb :"/extensions/tablesjs/views/example", :layout => :'/views/layouts/public'
end

get '/tablesjs/', :agent => /(.*)/ do
    erb :"/extensions/tablesjs/views/example", :layout => :'/views/layouts/public'
end
