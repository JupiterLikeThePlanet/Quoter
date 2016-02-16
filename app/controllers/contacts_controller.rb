class ContactsController < ApplicationController

  def index

    @contacts = current_user.contacts.all
  end

  def new
    @contact = Contact.new
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = current_user.contacts.create(contact_params)

    if @contact.save
      flash[:success] = "Contact Added!"
      redirect_to contacts_path
    else
      flash[:danger] = "Contact did not save, try again"
      render 'new'
    end
  end

  def edit
    #@contact = Contact.find(params[:id])
    @contact = current_user.contacts.find(params[:id])
  end

  def update
      @contact = Contact.find(params[:id])
      if @contact.update(contact_params)
        flash[:success] = "Contact updated!"
        redirect_to contacts_path
      else
        flash[:danger] = "Contact did not update, try again"
        render 'edit'
      end
  end

  def destroy
    @contact = Contact.find(params[:id]).destroy
    flash[:success] = "Contact Deleted!"
    redirect_to contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :number, user_id: current_user.id)
  end

end