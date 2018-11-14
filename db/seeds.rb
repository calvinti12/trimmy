Booking.destroy_all
Service.destroy_all
User.destroy_all

user_attributes = [
  {
    first_name: 'Alex',
    last_name: 'Roub',
    email: 'alex@email.com',
    password: '123456',
    hairstylist: false
  },
  {
    first_name: 'Nancy',
    last_name: 'Nan',
    email: 'nancy@email.com',
    password: '123456',
    hairstylist: true
  },
  {
    first_name: 'Luc',
    last_name: 'Luko',
    email: 'luc@email.com',
    password: '123456',
    hairstylist: false
  },
  {
    first_name: 'Vlad',
    last_name: 'Dislav',
    email: 'vlad@email.com',
    password: '123456',
    hairstylist: true
  }
]

service_attributes = [
  {
    name: 'Trim',
    description: 'Beautiful haircut for men',
    price: 20
  },
  {
    name: 'Shampoo',
    description: 'Shampoo and conditioner wash for any type of hair',
    price: 40
  },
  {
    name: 'Coloring',
    description: 'Any color for you to color your hair',
    price: 80
  }
]

booking_attributes = [
  {
    date: DateTime.new(2018,12,1,17),
    status: 'Pending'
  },
  {
    date: DateTime.new(2018,12,22,18),
    status: 'Pending'
  },
  {
    date: DateTime.new(2019,1,5,14),
    status: 'Pending'
  }
]

user_attributes.each do |attrs|
  user = User.create!(attrs)

  if user.hairstylist == true
    service_attributes.each do |serv_attrs|
      service = Service.new(serv_attrs)
      service.user = user
      service.save!
    end
  end
end

booking_attributes.each do |book_attrs|
  user = User.where(hairstylist: false).sample
  service = Service.all.sample
  booking = Booking.new(book_attrs)
  booking.user = user
  booking.service = service
  booking.save!
end


