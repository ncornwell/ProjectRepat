# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class QuestionsController < ApplicationController
  layout 'main'

  def index
    @title = "Questions"
  end

  def faq
    @title = "FAQ (Frequently Asked Questions)"
    @questions = Question.find(
      :all,
      :conditions => ["#{Question.connection.quote_column_name('featured')} = ?", true],
      :order => "-rank DESC, times_viewed DESC"
    )
  end

	# Ask a question, also known as /contact
	def ask
	  @title = "Contact us"
		@question = Question.new
	end
	
	def create_faq
	  @question = Question.new(params[:question])
		@question.short_question = "Message from the contact form"
    if !@question.save then
      flash.now[:notice] = 'There were some problems with the information you entered.<br/><br/>Please look at the fields below.'
      ask()
      render :action => 'ask'
    end
  end
	
	# Sends question via email to site owner
	def send_question
	  @question = Question.new(params[:question])
	  @question.short_question = "Message from the contact form"
	  
	  if !@question.valid?
	    flash[:notice] = "Please enter an email address and message"
	    ask()
	    render :action => 'ask' and return
    else
      mail = OrdersMailer.inquiry(
          @question.email_address,
          @question.long_question)

      OrdersMailer.deliver(mail, show_warning)
      
	    begin
        flash[:notice] = "Message sent successfully."
        redirect_to '/' and return
      rescue
        flash[:notice] = "There was a problem sending your email please try again"
  	    ask()
  	    render :action => 'ask' and return
      end
    end
  end
	
end
