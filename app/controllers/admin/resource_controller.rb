module Admin
  class ResourceController < ::Admin::ApplicationController
    helper_method :resources_path, :new_resource_path,
                  :edit_resource_path, :resource_path
    helper_method :resource, :resources, :singular_name
    add_flash_types :success

    def index
      instance_variable_set("@#{controller_name}", resources.page(params[:page]))
    end

    def new
      @title_parts << translate('new_resource')
    end

    def create
      @title_parts << translate('new_resource')
      if resource.save
        redirect_to resources_path, success: translate('flash.create_success')
      else
        render :new
      end
    end

    def edit
      @title_parts << translate('edit_resource', resource_id: resource.id)
    end

    def update
      @title_parts << translate('edit_resource', resource_id: resource.id)
      if resource.update(resource_params)
        redirect_to resources_path, success: translate('flash.update_success')
      else
        render :edit
      end
    end

    def destroy
      flash[:success] = translate('flash.destroy_success') if resource.destroy
      redirect_to resources_path
    end

    private

    def resource
      instance_variable_get("@#{controller_name.singularize}")
    end

    def resources
      instance_variable_get("@#{controller_name}")
    end

    def singular_name
      resource_name.gsub('/', '_').singularize
    end

    def resource_prefix
      controller_path
    end

    def resources_path(params = {})
      public_send("admin_#{resource_name.gsub('/', '_')}_path", params)
    end

    def new_resource_path(params = {})
      public_send("new_admin_#{singular_name}_path", params)
    end

    def edit_resource_path(params = {})
      public_send("edit_admin_#{singular_name}_path", params)
    end

    def resource_path(params = {})
      public_send("admin_#{singular_name}_path", params)
    end

    def resource_params
      params.require(singular_name).permit(permitted_params)
    end
  end
end
