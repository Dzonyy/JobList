module Admin
  class UsersController < ResourceController
    load_and_authorize_resource
  end
end