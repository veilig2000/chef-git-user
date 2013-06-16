name "git_user_test"
version "1.0.0"
description "Tests git_user_setup LWRP"

%w{ git_user user }.each { |c| depends c }
