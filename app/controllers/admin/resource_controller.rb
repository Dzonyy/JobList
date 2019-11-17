module Admin
  class ResourceController < ::Admin::ApplicationController
    helper_method :resources_path, :new_resource_path,
                  :edit_resource_path, :resource_path
    helper_method :resource, :resources, :singular_name

    add_flash_types :success

    def index
      instance_variable_set("@#{controller_name}", resources.page(params[:page]))
    end

    def new; end

    def create
      if resource.save
        redirect_to resources_path, success: translate('flash.create_success')
      else
        render :new
      end
    end

    def edit; end

    def update
      if resource.update_attributes(resource_params)
        redirect_to resources_path, success: translate('flash.update_success')
      else
        render :edit
      end
    end

    def reorder
      items = resources.all.index_by(&:id)
      inx = 0
      
      if params[:items].present?
        params[:items].values.each do |item|
          if item2 = items[item['id'].to_i]
            item2.position = (inx += 1)
          end
        end
      end

      if items.any?
        items.values.first.class.transaction do
          items.values.map { |item| item.changed? && item.save!(validate: false) }
        end
      end
      head :ok
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

    def resource_name
      controller_path.sub(/^admin\//, '')
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

    # def translate(key, options = {})
    #   t("resource.#{resource_name.gsub('/', '_').singularize}.#{key}", options)
    # end
  end
end
