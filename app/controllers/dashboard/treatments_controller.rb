# frozen_string_literal: true

module Dashboard
  class TreatmentsController < Dashboard::DashboardController
    def index
      @treatments = TreatmentPolicy::Scope.new(current_user, Treatment).resolve
    end

    def show
      @treatment = Treatment.find(params[:id])
      authorize @treatment
      @images_empty = @treatment.images.empty?
    end

    def new
      @treatment = Treatment.new
      authorize @treatment
    end

    def create
      @treatment = Treatment.new(treatment_params)
      authorize @treatment

      @treatment.user_id = current_user.id

      if @treatment.save
        redirect_to dashboard_treatment_path(@treatment)
      else
        render :new
      end
    end

    private

    def treatment_params
      params.require(:treatment).permit(:full_name, :date_of_visit, :treatment, :diagnosis,
                                        :special_conditions_and_additional_notes, images: [])
    end
  end
end
