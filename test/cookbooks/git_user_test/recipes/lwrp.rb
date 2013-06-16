include_recipe 'user'

user_account 'charlie'

git_user 'charlie' do
  private_key '123ABC'
  known_hosts %w{ github.com }
end

user_account 'bob'

git_user 'bob' do
  full_name   'Bob McAllister'
  email       'bob@example.com'
end
