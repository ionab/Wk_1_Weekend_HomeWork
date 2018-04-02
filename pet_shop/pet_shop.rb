#Don't need to use the @symbol in your arguments in here.

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  return pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, add_number_pet_sold)
  return pet_shop[:admin][:pets_sold] += add_number_pet_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, pet_breed)
pets = []
  for pet in pet_shop[:pets]
    if pet_breed == pet[:breed]
      pets.push(pet[:breed])
    end
  end
  return pets
end

def find_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
    pet_shop[:pets].delete(pet) #remove pet not the name
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customers)
  #for customer in customers
    return customers[:pets].length
  #end
end

def add_pet_to_customer(customers, new_pet)
  customers[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
    return customer[:cash] >= new_pet[:price]
end

#what happens when you sell a pet... if the customer can afford the pet
#you add the pet to the customers
#you deduct the price of a pet from the customers total_cash
#you remove the pet from the pet shop inventory
#you increase the number of pets sold
#you add the cash from the sale to your bank
#what happens if the pet the customer wants to buy doesn't exist
#so argument pet needs to not equal nil
#so update your if statement so pet needs to be true to proceed
def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil && customer_can_afford_pet(customer, pet) #basically enter if true # could refractor this to  if pet != nil
    add_pet_to_customer(customer, pet)
    customer[:cash] -= pet[:price]
    remove_pet_by_name(pet_shop, pet)
    increase_pets_sold(pet_shop, 1)
    add_or_remove_cash(pet_shop, pet[:price])
  end
end
