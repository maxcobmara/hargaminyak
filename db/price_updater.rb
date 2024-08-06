# https://www.petron.com.my/what-we-offer/products/fuels/retail-fuels/petron-blaze-100-euro-4m/  
# https://www.shell.com.my/motorists/shell-fuels/fuelprice.html 


Price.where(:price_on => ("12 Apr 2024".to_date)..("24 Apr 2024".to_date)).order(price_on: :asc)
prices = Price.where(price_on: ("07 Apr 2024".to_date))


Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "01 Aug 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "01 Aug 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "01 Aug 2024".to_date, price:	335},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "01 Aug 2024".to_date, price:	355},  
  {entity_id: 5, entity_name: "RON100", price_on: "01 Aug 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "01 Aug 2024".to_date, price:	630}
])

Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "25 Jul 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "25 Jul 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "25 Jul 2024".to_date, price:	335},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "25 Jul 2024".to_date, price:	355},  
  {entity_id: 5, entity_name: "RON100", price_on: "25 Jul 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "25 Jul 2024".to_date, price:	630}
])

Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "18 Jul 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "18 Jul 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "18 Jul 2024".to_date, price:	335},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "18 Jul 2024".to_date, price:	355},  
  {entity_id: 5, entity_name: "RON100", price_on: "18 Jul 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "18 Jul 2024".to_date, price:	630}
])


Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "05 Jul 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "05 Jul 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "05 Jul 2024".to_date, price:	335},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "05 Jul 2024".to_date, price:	355},  
  {entity_id: 5, entity_name: "RON100", price_on: "05 Jul 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "05 Jul 2024".to_date, price:	620}
])

Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "05 Jul 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "05 Jul 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "05 Jul 2024".to_date, price:	335},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "05 Jul 2024".to_date, price:	355},  
  {entity_id: 5, entity_name: "RON100", price_on: "05 Jul 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "05 Jul 2024".to_date, price:	620}
])



Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "27 Jun 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "27 Jun 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "27 Jun 2024".to_date, price:	335},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "27 Jun 2024".to_date, price:	355},  
  {entity_id: 5, entity_name: "RON100", price_on: "27 Jun 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "27 Jun 2024".to_date, price:	620}
])

Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "20 Jun 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "20 Jun 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "20 Jun 2024".to_date, price:	335},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "20 Jun 2024".to_date, price:	355},  
  {entity_id: 5, entity_name: "RON100", price_on: "20 Jun 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "20 Jun 2024".to_date, price:	630}
])




Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "13 Jun 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "13 Jun 2024".to_date, price:	347},  
  {entity_id: 5, entity_name: "RON100", price_on: "13 Jun 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "13 Jun 2024".to_date, price:	630}
])

Price.create!([
  {entity_id: 3, entity_name: "Diesel", price_on: "10 Jun".to_date, price:	335},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "10 Jun".to_date, price:	355},  
])

Price.create!([
  {entity_id: 5, entity_name: "RON100", price_on: "18 Apr 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "18 Apr 2024".to_date, price:	620}
])

Price.create!([
  {entity_id: 5, entity_name: "RON100", price_on: "11 Apr 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "11 Apr 2024".to_date, price:	620}
])
Price.create!([
  {entity_id: 5, entity_name: "RON100", price_on: "04 Apr 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "04 Apr 2024".to_date, price:	610}
])
Price.create!([
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "28 Mar 2024".to_date, price:	235},
  {entity_id: 5, entity_name: "RON100", price_on: "28 Mar 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "28 Mar 2024".to_date, price:	600}
])

Price.create!([
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "21 Mar 2024".to_date, price:	235},  
  {entity_id: 5, entity_name: "RON100", price_on: "21 Mar 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "21 Mar 2024".to_date, price:	600}
])

Price.create!([
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "14 Mar 2024".to_date, price:	235},  
  {entity_id: 5, entity_name: "RON100", price_on: "14 Mar 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "14 Mar 2024".to_date, price:	600}
])


Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "06 Jun 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "06 Jun".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "06 Jun".to_date, price:	215},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "06 Jun".to_date, price:	235},  
  {entity_id: 5, entity_name: "RON100", price_on: "06 Jun".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "06 Jun".to_date, price:	630}
])

Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "30 May 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "30 May 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "30 May 2024".to_date, price:	215},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "30 May 2024".to_date, price:	235},  
  {entity_id: 5, entity_name: "RON100", price_on: "30 May 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "30 May 2024".to_date, price:	640}
])

Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "23 May 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "23 May 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "23 May 2024".to_date, price:	215},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "23 May 2024".to_date, price:	235},  
  {entity_id: 5, entity_name: "RON100", price_on: "23 May 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "23 May 2024".to_date, price:	640}
])


Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "16 May 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "16 May 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "16 May 2024".to_date, price:	215},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "16 May 2024".to_date, price:	235},  
  {entity_id: 5, entity_name: "RON100", price_on: "16 May 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "16 May 2024".to_date, price:	640}
])



Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "09 May 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "09 May 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "09 May 2024".to_date, price:	215},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "09 May 2024".to_date, price:	235},  
  {entity_id: 5, entity_name: "RON100", price_on: "09 May 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "09 May 2024".to_date, price:	640}
])

Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "02 May 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "02 May 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "02 May 2024".to_date, price:	215},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "02 May 2024".to_date, price:	235},  
  {entity_id: 5, entity_name: "RON100", price_on: "02 May 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "02 May 2024".to_date, price:	640}
])

Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "25 Apr 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "25 Apr 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "25 Apr 2024".to_date, price:	215},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "25 Apr 2024".to_date, price:	235},  
  {entity_id: 5, entity_name: "RON100", price_on: "25 Apr 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "25 Apr 2024".to_date, price:	620}
])

Price.create!([
  {entity_id: 1, entity_name: "RON95",  price_on: "25 Apr 2024".to_date, price:	205},
  {entity_id: 2, entity_name: "RON97",  price_on: "25 Apr 2024".to_date, price:	347}, 
  {entity_id: 3, entity_name: "Diesel", price_on: "25 Apr 2024".to_date, price:	215},
  {entity_id: 4, entity_name: "Diesel Euro5", price_on: "25 Apr 2024".to_date, price:	235},  
  {entity_id: 5, entity_name: "RON100", price_on: "25 Apr 2024".to_date, price:	500}, 
  {entity_id: 6, entity_name: "VPower", price_on: "25 Apr 2024".to_date, price:	620}
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

