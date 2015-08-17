class ContactsController < ApplicationController

  def index
    user = User.includes(:contacts, :shared_contacts).find(params[:user_id])

    results = [user.contacts, user.shared_contacts]

    render json: results
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
    contact = Contact.find(params[:id])

    if contact.destroy(params[:id])
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :user_id)
    end
end
