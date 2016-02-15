class MessagesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    @contacts = current_user.contacts
    @source = Resource.all
  end

  def create
    @contact = Contact.find(params[:id])
    @source = Resource.find(params[:api_id])

    # account_sid = ENV["TWILIO_SID"]
    # auth_token = ENV["TWILIO_AUTH_TOKEN"]
    #test



    @client = Twilio::REST::Client.new account_sid, auth_token

    resp = Net::HTTP.get_response(URI.parse(@source.link))

    data = resp.body
    quote = JSON.parse(data)
    @text = eval(@source.access)

    if @text.length > 160
      n = @text.length
      first = @text[0..121]
      second = @text[122..n]

      @client.account.sms.messages.create({
        :from => "+1 985-605-0721",
        :to => @contact.number,
        :body => first
      })

      @client.account.sms.messages.create({
        :from => "+1 985-605-0721",
        :to => @contact.number,
        :body => second
      })

    flash[:success] = "Message Sent In Two Parts"

    elsif
      @client.account.sms.messages.create({
        :from => "+1 985-605-0721",
        :to => @contact.number,
        :body => @text
      })

      flash[:success] = "Message Sent"

    else
      flash[:danger] = "Message Too Long Or Did Not Send"

    end

    redirect_to new_message_path

  end

end
