CharacterPrivilege.destroy_all
Invite.destroy_all
Character.destroy_all
Guild.destroy_all
User.destroy_all
Game.destroy_all

game_data = ['Albion Online', 'World of Warcraft', 'Lineage II', 'Archeage', 'Black Desert Online']
game_data = game_data.reduce([]) { |arr, title| arr << { title: title }; arr }

def user_data
  res = []
  100.times do
    res << {
      email: Faker::Internet.email,
      password: '1q2w3e4r',
      password_confirmation: '1q2w3e4r'
    }
  end
  res
end

def guild_data
  res = []
  user_ids = User.pluck(:id)
  game_ids = Game.pluck(:id)
  10.times do
    res << {
      title: Faker::GameOfThrones.house,
      game_id: game_ids.sample,
      user_id: user_ids.sample
    }
  end
  res
end

def character_data
  res = []
  user_ids = User.pluck(:id)
  game_ids = Game.pluck(:id)
  guild_ids = Guild.pluck(:id)
  50.times do
    res << {
      name: Faker::GameOfThrones.character,
      description: Faker::Hipster.paragraphs(2),
      game_id: game_ids.sample,
      user_id: user_ids.sample,
      guild_id: guild_ids.sample
    }
  end
  res
end

def character_privilege_data
  res = []
  character_ids = Character.pluck(:id)
  allowed_privileges = ['Newsmaker', 'Officer', 'Designer', 'Recruter']
  character_ids.each do |char_id|
    res << {
      character_id: char_id,
      granted_modules: [allowed_privileges.sample],
    }
  end
  res
end

def invite_data
  res = []
  character_ids = Character.pluck(:id)
  guild_ids = Guild.pluck(:id)
  50.times do
    res << {
      state: 'suspense',
      description: Faker::Hipster.paragraphs(2),
      character_id: character_ids.sample,
      guild_id: guild_ids.sample
    }
  end
  res
end

Game.create(game_data)
User.create(user_data)
Guild.create(guild_data)
Character.create(character_data)
CharacterPrivilege.create(character_privilege_data)
Invite.create(invite_data)
