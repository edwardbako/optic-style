# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Branch.count == 0
  Branch.create(
          short_address: 'Красный проспект, 59',
          address: '630091, г. Новосибирск, Красный проспект, 59',
          phone: '+7 (383) 221-45-05',
          open_hours: ['10:00 - 19:30', 'воскресенье 10:00 - 17:00'],
          email: 'optika–style@ngs.ru'
  )
  Branch.create(
          short_address: 'Красный проспект, 69',
          address: '630091, г. Новосибирск, Красный проспект, 69',
          phone: '+7 (383) 221–87–68',
          open_hours: ['10:00 - 19:30', 'суббота 10:00 - 18:00', 'воскресенье 10:00 - 17:00'],
          email: 'optika–style@ngs.ru'
  )
  Branch.create(
          short_address: 'Гоголя, 29',
          address: '630005, г. Новосибирск, Гоголя, 29',
          phone: '+7 (383) 224–26–30',
          open_hours: ['10:00 - 19:00', 'суббота 10:00 - 18:00', 'воскресенье 10:00 - 16:00'],
          email: 'optika–style@ngs.ru'
  )
  Branch.create(
          short_address: 'Бориса Богаткова, 260',
          address: '630089, г. Новосибирск, Бориса Богаткова, 260',
          phone: '+7 (383) 264–10–77',
          open_hours: ['10:00 - 19:30', 'суббота 10:00 - 18:00', 'воскресенье 10:00 - 17:00'],
          email: 'optika–style@ngs.ru'
  )
  Branch.create(
          short_address: 'Кирова, 82',
          address: '630102, г. Новосибирск, Кирова, 82',
          phone: '+7 (383) 266–15–10',
          open_hours: ['10:00 - 19:30', 'суббота, воскресенье 10:00 - 16:00'],
          email: 'optika–style@ngs.ru'
  )
  Branch.create(
          short_address: 'Станиславского, 16',
          address: '630054, г. Новосибирск, Станиславского, 16',
          phone: '+7 (383) 343–58–22',
          open_hours: ['10:00 - 19:00', 'суббота 10:00 - 18:00', 'воскресенье 10:00 - 16:00'],
          email: 'optika–style@ngs.ru'
  )

end