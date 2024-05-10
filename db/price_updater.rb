Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "09 May 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "09 May 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "09 May 2024".to_date, price:	215},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "09 May 2024".to_date, price:	235},  
  {entity_id: 5, entity_name: "RON100", price_on: "09 May 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "09 May 2024".to_date, price:	640}
])



Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "25 Apr 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "25 Apr 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "25 Apr 2024".to_date, price:	215},
])


Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "21 Mar 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "21 Mar 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "21 Mar 2024".to_date, price:	215}
])
  
  
# https://www.petron.com.my/what-we-offer/products/fuels/retail-fuels/petron-blaze-100-euro-4m/  
# https://www.shell.com.my/motorists/shell-fuels/fuelprice.html  


puts "2024 Q2 Fuel Prices"
Price.create!([
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "09 May 2024".to_date, price:	235},  
  {entity_id: 5, entity_name: "RON100", price_on: "09 May 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "09 May 2024".to_date, price:	640},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "25 Apr 2024".to_date, price:	235},  
  {entity_id: 5, entity_name: "RON100", price_on: "25 Apr 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "25 Apr 2024".to_date, price:	620},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "25 Apr 2024".to_date, price:	235},  
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "25 Apr 2024".to_date, price:	235},  
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "25 Apr 2024".to_date, price:	235}
])