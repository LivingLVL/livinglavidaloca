class CartController < ApplicationController
  before_action :authenticate_user!
  
  def add
    # this code is to get the ID of the product
    id = params[:id]

   # the code below we use when the cart is already created, you can use the cart that exist already or create a empty one  
   if session[:cart] then
    cart = session[:cart]
   else
    session[:cart] = {}
    cart = session[:cart]
  end


  # When a product was in he cart already, this code set he id of he product, 
  # setting 1 more since the last added (looping right?!)****  if cart[id] then
  if cart[id] then
    cart[id] = cart[id] + 1
  else
    cart[id]= 1
  end  
  
    redirect_to :action => :index
  
  end

  def clearCart
    #sets session variable to nil and bring back to index*********** 
    session[:cart] = nil
    redirect_to :action => :index
    
  end 
  

  def index
    # passes a cart to display*********
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end 
  end
  
    
    # code o remove items 
    def remove
    
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    
    redirect_to :cart
    
    end
    
     def addqty
   
    id = params[:id]
    cart = session[:cart]

      cart[id] = cart[id] + 1
    
    
  
    redirect_to :action => :index
  
   end
  
    def removeqty
        id = params[:id]
        cart = session[:cart]
        
      if cart[id] > 1 then
        cart[id] = cart[id] - 1
      else
        cart.delete id
        
    end  
  
    redirect_to :action => :index
  
  end
  
  
    def createOrder
 # Step 1: Get the current user
    @user = User.find(current_user.id)

 # Step 2: Create a new order and associate it with the current user
    @order = @user.orders.build(:order_date => DateTime.now, :status => 'Pending')
    @order.save

 # Step 3: For each item in the cart, create a new item on the order!!
    @cart = session[:cart] || {} # Get the content of the Cart
    @cart.each do | id, quantity |
   
  item = Item.find_by_id(id)
 
    @orderitem = @order.orderitems.build(:item_id => item.id, :title => item.title, 
    :description => item.description, :quantity => quantity, :price=> item.price)
 
    @orderitem.save
 
    end

 
   @orders = Order.last
   
   @orderitems = Orderitem.where(order_id: Order.last)
    
   session[:cart] = nil
         
  end
  



 
end