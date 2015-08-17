class ContactsController < ApplicationController

  def index
    render json: User.find(params[:user_id]).contacts + User.find(params[:user_id]).shared_contacts
  end

  def show
    render json: Contact.find(params[:id])
  end

  def create
    contact = Contact.new(contact_params)

    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    contact = Contact.find(params[:id])

    if contact.update(contact_params)
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact = Contact.destroy(params[:id])
    render json: contact
  end

  private

    def contact_params
      params[:contact].permit(:name, :email, :user_id)
    end
end
