# https://www.petron.com.my/what-we-offer/products/fuels/retail-fuels/petron-blaze-100-euro-4m/
# https://www.shell.com.my/motorists/shell-fuels/fuelprice.html


Price.where(:price_on => ("12 Apr 2024".to_date)..("24 Apr 2024".to_date)).order(price_on: :asc)
prices = Price.where(price_on: ("07 Apr 2024".to_date))


Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "02 Jan 2025".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "02 Jan 2025".to_date, price:	328},
  {entity_id: 3, entity_name: "Diesel", price_on: "02 Jan 2025".to_date, price:	298},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "02 Jan 2025".to_date, price:	318},
  {entity_id: 5, entity_name: "RON100", price_on: "02 Jan 2025".to_date, price:	500},
  {entity_id: 6, entity_name: "VPower", price_on: "02 Jan 2025".to_date, price:	626}
])


Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "31 Oct 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "31 Oct  2024".to_date, price:	319},
  {entity_id: 3, entity_name: "Diesel", price_on: "31 Oct  2024".to_date, price:	295},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "31 Oct 2024".to_date, price:	315},
  {entity_id: 5, entity_name: "RON100", price_on: "31 Oct 2024".to_date, price:	500},
  {entity_id: 6, entity_name: "VPower", price_on: "31 Oct 2024".to_date, price:	620},
])



















# https://www.petron.com.my/what-we-offer/products/fuels/retail-fuels/petron-blaze-100-euro-4m/
# https://www.shell.com.my/motorists/shell-fuels/fuelprice.html
