class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
     #session[:cart] = nil
   
  end

  def about
    #session[:cart] = nil
  end

  def contact
   # @user = User.find(current_user.id)
  #  @user.update_attribute(:admin , true)
  end
  
  def paid
    #redirect_to "/cart/clear"
    flash[:notice] = 'Transaction Complete'
    @order = Order.last
    @order.update_attribute(:status , "Paid by User: #{current_user.email}")
    #"Paid by User:#{current_user.id} #{current_user.name} #{current_user.surname}")
    
  end

  def category
    catName = params[:title]
    @items = Item.where("category like ? ", catName)
  end
  
   def sold
    @order = Order.find(params[:id])
    @order.update_attribute(:status, "Paid with Paypal")
    end
end
