# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1=User.new({email:'s@s.com', name:'Salvador', password:'123456', password_confirmation:'123456'})
u1.avatar=Pathname.new(Rails.root.join("app/assets/images/actor_avatar_people_person_profile_user_voice_icon_123373.png")).open
u1.save

u2=User.new({email:'c@c.com', name:'Charles', password:'123456', password_confirmation:'123456'})
u2.avatar=Pathname.new(Rails.root.join("app/assets/images/avatar_boy_people_person_profile_tom_user_icon_123367.png")).open
u2.save

u3=User.new({email:'m@m.com', name:'Michael', password:'123456', password_confirmation:'123456'})
u3.avatar=Pathname.new(Rails.root.join("app/assets/images/avatar_boy_people_person_profile_tom_user_icon_123367.png")).open
u3.save

g1=Group.new(name:'Meetings', icon:'fa-handshake', user_id:1)
g1.save

g2=Group.new(name:'US Trip', icon:'fa-plane', user_id:2)
g2.save

g3=Group.new(name:'Gadgets', icon:'fa-laptop', user_id:2)
g3.save

e1=Transaction.new(name:'Food', amount:25, user_id:1, group_id:1)
e1.save

e1=Transaction.new(name:'Coffe', amount:10 , user_id:2, group_id:1)
e1.save

e1=Transaction.new(name:'Dinner', amount:150 , user_id:3, group_id:1)
e1.save

e1=Transaction.new(name:'Hotel', amount:1025, user_id:1, group_id:2)
e1.save

e1=Transaction.new(name:'Plane', amount:1000 , user_id:2, group_id:2)
e1.save

e1=Transaction.new(name:'Uber', amount:150 , user_id:3, group_id:2)
e1.save

e1=Transaction.new(name:'Ipad', amount:329, user_id:1, group_id:3)
e1.save

e1=Transaction.new(name:'Phone', amount:600 , user_id:2, group_id:3)
e1.save

e1=Transaction.new(name:'Hotspot', amount:250 , user_id:3, group_id:3)
e1.save

e1=Transaction.new(name:'Office papers', amount:50, user_id:1)
e1.save

e1=Transaction.new(name:'Gifts', amount:100 , user_id:2)
e1.save

e1=Transaction.new(name:'Tissues', amount:10 , user_id:3)
e1.save