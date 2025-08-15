puts "Cleaning up database..."
Review.destroy_all
Restaurant.destroy_all

puts "Creating restaurants with reviews..."

tacos = Restaurant.create!(
  name: "Tacos El Astro",
  description: "Famous for their authentic al pastor tacos."
)

pasta = Restaurant.create!(
  name: "Pasta Nostra",
  description: "Cozy Italian spot with homemade pasta."
)

sushi = Restaurant.create!(
  name: "Sushi Go",
  description: "Fresh nigiri and creative rolls."
)

# Add reviews for Tacos El Astro
tacos.reviews.create!(content: "Best tacos in town!", rating: 5)
tacos.reviews.create!(content: "Loved the spicy salsa.", rating: 4)

# Add reviews for Pasta Nostra
pasta.reviews.create!(content: "Pasta was perfectly cooked.", rating: 5)
pasta.reviews.create!(content: "Great wine pairing.", rating: 4)

# Add reviews for Sushi Go
sushi.reviews.create!(content: "Fish was incredibly fresh.", rating: 5)
sushi.reviews.create!(content: "Creative and tasty rolls.", rating: 4)

puts "Seeding completed!"
