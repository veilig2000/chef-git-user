describe "data_bag"
  it "should configure git when enabled"
    assert file_present /home/joe/.gitconfig

  it "should have the git name configured"
    git_name=$(su - joe -c 'git config --get user.name')
    assert equal "$git_name" "Joseph Man Jr."

  it "should set the correct ssh key file owner"
    file_owner=$(ls -l /home/joe/.ssh/git_user_rsa | awk '{ print $3 }')
    assert equal "$file_owner" "joe"

  it "should not configure git when disabled"
    assert file_absent /home/testman/.gitconfig

end_describe
