# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0
  User.create(
        first_name: 'Основной',
        last_name: 'Администратор',
        email: 'admin@optika-style.ru',
        password: 'f5d2bd68d7',
        confirmed_at: Time.now,
        role: :admin
  )
end

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


if Client.count == 0
  ClientsImport.new.process
end

# Client.all.each do |c|
#   if c.orders.count < c.recipes.count
#   else
#     c.orders.each_with_index do |o, i|
#       r = c.recipes[i]
#
#       if r.present?
#         o.od_sph = r.od_sph
#         o.od_cyl = r.od_cyl
#         o.od_ax = r.od_ax
#         o.od_add = r.od_add
#         o.os_sph = r.os_sph
#         o.os_cyl = r.os_cyl
#         o.os_ax = r.os_ax
#         o.os_add = r.os_add
#         o.dp = r.dp
#
#         o.comment = "#{o.comment} #{r.comment}"
#
#         o.save
#       end
#     end
#   end
# end