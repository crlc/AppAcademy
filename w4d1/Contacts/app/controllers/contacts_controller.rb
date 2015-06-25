class ContactsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    hash = {contacts: user.contacts, shared: user.shared_contacts}
    
    render json: hash
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages
    end
  end

  def show
    @contact = Contact.find(params[:id])

    render json: @contact
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors.full_messages
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    render json: @contact
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
