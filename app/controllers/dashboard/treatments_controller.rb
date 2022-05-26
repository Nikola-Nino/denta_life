# frozen_string_literal: true

module Dashboard
  class TreatmentsController < Dashboard::DashboardController
    def index
      @treatments = current_user.treatments
    end

    def show
      @treatment = Treatment.find(params[:id])
      @images_empty = @treatment.images.empty?
    end

    def new
      @treatment = Treatment.new
    end

    def create
      @treatment = Treatment.new(treatment_params)
      @treatment.user_id = current_user.id

      if @treatment.save
        # redirect_to dashboard_treatments_path
        redirect_to "/dashboard/treatments/#{@treatment.id}"
      else
        render :new
      end
    end

    def edit; end

    def update
      if @treatment.update(treatment_params)
        redirect_to @treatment
      else
        render :edit
      end
    end

    def destroy
      @treatment.destroy

      redirect_to treatments_path
    end

    private

    def treatment_params
      params.require(:treatment).permit(:full_name, :date_of_visit, :treatment, :diagnosis,
                                        :special_conditions_and_additional_notes, images: [])
    end
  end
end
