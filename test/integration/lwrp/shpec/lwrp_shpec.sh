describe "lwrp"
  describe "mandatory attributes provided"
    it "should create .gitconfig for user charlie"
      assert file_present '/home/charlie/.gitconfig'

    it "should include the correct private key"
      private_key=$(cat /home/charlie/.ssh/git_user_rsa)
      assert equal "$private_key" "123ABC"

  end_describe

  describe "known_hosts provided"
    it "should create an ssh config"
      grep "Host github.com" /home/charlie/.ssh/config
      assert equal "$?" 0

    it "should add hosts to /etc/ssh/ssh_known_hosts"
      grep "github.com" /etc/ssh/ssh_known_hosts
      assert equal "$?" 0

  end_describe


  describe "name and email provided"
    it "should have git name configured"
      git_name=$(su - bob -c 'git config --get user.name')
      assert equal "$git_name" "Bob McAllister"

    it "should have git email configured"
      git_name=$(su - bob -c 'git config --get user.email')
      assert equal "$git_name" "bob@example.com"

  end_describe

end_describe
