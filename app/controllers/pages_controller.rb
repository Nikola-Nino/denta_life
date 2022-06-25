# frozen_string_literal: true

class PagesController < ApplicationController
  def home; end

  def about; end

  def privacy; end

  def contact
    @contact = Contact.new
  end

  def create_contact
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_contact_email(@contact).deliver
      redirect_to root_path, notice: t('notice_success')

    else
      render :contact
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :email, :phone, :message)
  end
end
