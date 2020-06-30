User.create!([
  {name: "Dani", email: "dani@gmail.com", password_digest: "$2a$12$5Qf8GVMmWDaFpXslcQ.Y/eW2lYxQ7zVfI8.Zta4ZuCQLzKuZwYs0C"},
  {name: "Cheddar", email: "cheddar@gmail.com", password_digest: "$2a$12$aOy7SZn3ucc3z4YbYJoatu63wRpUfknXUtrWbidju0/dnpTG7Abqe"}
])
Recipe.create!([
  {title: "Licorice", ingredients: "Licorice", prep_time: 120, directions: "Buy licorice from store.", image_url: "http://cdn2.bigcommerce.com/server6200/aa739/product_images/uploaded_images/red-licorice.png?t=1398725710", user_id: 1},
  {title: "Corn on the cob", ingredients: "Corn, cob", prep_time: 22, directions: "Place corn on the cob, grill for 20 minutes, enjoy!", image_url: "http://www.scientificamerican.com/sciam/cache/file/59C0122F-509C-4FEE-99A67FC20C50CEF1.jpg", user_id: 1},
  {title: "Raw Eggs", ingredients: "Chicken", prep_time: 1, directions: "Squeeze the chicken", image_url: "http://swansonhealthcenter.com/wp-content/uploads/2011/07/Egg.jpg", user_id: 2},
  {title: "Empty Sandwich", ingredients: "Two slices of bread", prep_time: 72, directions: "Place slices of bread next to each other.", image_url: "http://www.phoenixisstrategic.com/wp-content/uploads/2013/05/blog-empty-sandwich.jpg", user_id: 2},
  {title: "Mud Pie", ingredients: "Flour, water, mud.", prep_time: 84, directions: "Mix flour and water, add mud, bake at 350 degrees for 1 hour.", image_url: "http://cdn-image.myrecipes.com/sites/default/files/styles/300x300/public/image/recipes/sl/05/12/mocha-mud-pie-sl-257949-x.jpg?itok=_ChocANl", user_id: 2},
  {title: "Peanut Butter Cookies", ingredients: "Butter, sugar, eggs, peanut butter, flour", prep_time: 30, directions: "Mix ingredients and bake at 350 for 15 minutes", image_url: "https://images-gmi-pmc.edge-generalmills.com/dcd4f799-7353-4e56-ba50-623581cba3bc.jpg", user_id: 2},
  {title: "Chocolate Chip Cookies", ingredients: "Flour, butter, sugar, chocolate chips, eggs", prep_time: 30, directions: "Mix ingredients, bake at 350", image_url: "https://images-gmi-pmc.edge-generalmills.com/087d17eb-500e-4b26-abd1-4f9ffa96a2c6.jpg", user_id: 2}
])
