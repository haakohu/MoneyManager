# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bills = MasterCategory.create(name: 'Bills')
clothing = MasterCategory.create(name: 'Clothing')
digital = MasterCategory.create(name: 'Digital')
food = MasterCategory.create(name: 'Food & Dining')
health = MasterCategory.create(name: 'Health care')
housing = MasterCategory.create(name: 'Housing')
leisure = MasterCategory.create(name: 'Leisure')
other = MasterCategory.create(name: 'Other')
Category.create(name: 'Other',master_category: other)
Category.create(name: 'Cable', master_category: bills)
Category.create(name: 'Gas',master_category: bills)
Category.create(name: 'Internet/Broadband',master_category: bills)
Category.create(name: 'Mobile phone',master_category: bills)
Category.create(name: 'Other',master_category: bills)
Category.create(name: 'Phone',master_category: bills)
Category.create(name: 'Water',master_category: bills)
Category.create(name: 'Rent',master_category: bills)
Category.create(name: 'Accessories',master_category: clothing)
Category.create(name: 'Clothes',master_category: clothing)
Category.create(name: 'Jewelry',master_category: clothing)
Category.create(name: 'Other',master_category: clothing)
Category.create(name: 'Shoes',master_category: clothing)
Category.create(name: 'Apps',master_category: digital)
Category.create(name: 'Books',master_category: digital)
Category.create(name: 'Movies',master_category: digital)
Category.create(name: 'Music',master_category: digital)
Category.create(name: 'Other',master_category: digital)
Category.create(name: 'Podcasts',master_category: digital)
Category.create(name: 'TV shows',master_category: digital)
Category.create(name: 'Dining/Eating out',master_category: food)
Category.create(name: 'Groceries',master_category: food)
Category.create(name: 'Other',master_category: food)
Category.create(name: 'Dental',master_category: health)
Category.create(name: 'Eye Care',master_category: health)
Category.create(name: 'Health Insurance',master_category: health)
Category.create(name: 'Medical',master_category: health)
Category.create(name: 'Other',master_category: health)
Category.create(name: 'Pharmacy',master_category: health)
Category.create(name: 'Home Insurance',master_category: housing)
Category.create(name: 'Maintenance',master_category: housing)
Category.create(name: 'Mortgage',master_category: housing)
Category.create(name: 'Other',master_category: housing)
Category.create(name: 'Rent',master_category: housing)
Category.create(name: 'Furniture/Accessories',master_category: housing)
Category.create(name: 'Entertainment',master_category: leisure)
Category.create(name: 'Fitness/Sport',master_category: leisure)
Category.create(name: 'Other',master_category: leisure)
Category.create(name: 'Personal Care',master_category: leisure)
Category.create(name: 'Drinks',master_category: other)
Category.create(name: 'Transportation',master_category: other)
Category.create(name: 'Electronics',master_category: other)
Category.create(name: 'Loans',master_category: other)
Category.create(name: 'Other',master_category: other)
Category.create(name: 'School',master_category: other)
Category.create(name: 'Taxes',master_category: other)
Category.create(name: 'Travel',master_category: other)

user = User.create(email: 'test@email.com', password: '1234qwer1234', password_confirmation: '1234qwer1234')
Account.create(name: 'Sparekonto', balance: 0,user_id: 1)
Account.create(name: 'Brukskonto',balance: 0, user_id: 1)
