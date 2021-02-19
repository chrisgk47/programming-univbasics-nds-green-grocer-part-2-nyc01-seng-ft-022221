require_relative './part_1_solution.rb'
require 'pry'
#cart = [{:item=>"AVOCADO", :price=>3.0, :clearance=>true, :count=>2}]
#coupons = [{:item=>"AVOCADO", :num=>2, :cost=>5.0}]

def apply_coupons(cart, coupons)
  new_cart = []
  coupons.each do |coupon|
    name = coupon[:item]
    cart.each do |incart|
      if incart[:item] == name && incart[:count] >= coupon[:num]
        new_name = "#{name} W/COUPON"
        new_hash = {
          :item => new_name,
          :price => coupon[:cost]/coupon[:num],
          :clearance => incart[:clearance],
          :count => coupon[:num]
        }
        incart[:count] -= new_hash[:count]
        cart << new_hash
      end
    end
  end
  cart
end


def apply_clearance(cart)
  #binding.pry
  new_cart =[]
  cart.each do |item|
    #binding.pry
    if item[:clearance] == true
      item[:price] = (item[:price] * 0.8).round(2)
    end
  end
end


def checkout(cart, coupons) #cart = [{:item=>"BEETS", :price=>2.5, :clearance=>false}], coupons = []
  #binding.pry
  cart.each do |contents|
    consolidate(contents)
    apply_coupons(contents, coupons)
    apply_clearance(contents)
  end
end
    
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
