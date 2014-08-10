require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup  
    # テストメソッドの実行前に行いたい内容を記述  
    # texture の読込のような、リソースの初期化など  
    # e.g.) @u = users(:user1)  
  end  
  def teardown  
    # テストメソッドの実行後に行いたい内容を記述  
    # リソースの破棄など  
    # e.g.) @u = nil  
  end  
  
  test "user save" do  
   #user = User.new({  
    #  :nickname => 'user',  
     # :mail => 'test@example.com'  
    #})  
   #length min check amd format check
   user=User.new
   assert_equal User.regist(user),false
   assert_equal user.errors[:nickname].length,2
   assert_equal "は4文字以上で入力してください。",user.errors[:nickname][0]
   assert_equal "は不正な値です。",user.errors[:nickname][1]
   assert_equal user.errors[:mail].length,2
   assert_equal "は5文字以上で入力してください。",user.errors[:mail][0]
   assert_equal "は不正な値です。",user.errors[:mail][1]
   assert_equal user.errors[:password].length,2
   assert_equal "は4文字以上で入力してください。",user.errors[:password][0]
   assert_equal "は不正な値です。",user.errors[:password][1]
    #length max check amd format check
   user.nickname="aaaaaaaaaaaaaaaaaaaaa"
   user.mail="testssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
   user.password="aaaaaaaaaaaaaaaaaaaaa"
   assert_equal User.regist(user),false
   assert_equal user.errors[:nickname].length,1
   assert_equal "は20文字以内で入力してください。",user.errors[:nickname][0]
   assert_equal user.errors[:mail].length,2
   assert_equal "は100文字以内で入力してください。",user.errors[:mail][0]
   assert_equal "は不正な値です。",user.errors[:mail][1]
   assert_equal user.errors[:password].length,1
   assert_equal "は20文字以内で入力してください。",user.errors[:password][0]
   #nickname and mail uniqueness
   user.nickname="mynickname"
   user.mail="mymail@co.jp"
   user.password="aaaaaaaaaaaaaaaaaaaa"
   assert_equal User.regist(user),false
   assert_equal user.errors[:nickname].length,1
   assert_equal "はすでに存在します。",user.errors[:nickname][0]
   assert_equal user.errors[:mail].length,1
   assert_equal "はすでに存在します。",user.errors[:mail][0]
   assert_equal user.errors[:password].length,0
   #success
   user.nickname=Digest::MD5.hexdigest("mynickname"+Time.now.to_s).to_s[0,20]
   user.mail=Digest::MD5.hexdigest("mymail@co.jp"+Time.now.to_s).to_s[0,20]+"@co.jp"
   assert User.regist(user)," Failure: user regoster."
  end  
  
  test "user auth" do
    user=User.new(:nickname=>"ahoaho",:password=>"ahoaho")
    #nouser
    assert_equal User.auth(user),false
    #password mistake.
    user.nickname="sohara"
    assert_equal User.auth(user),false
    #auth success
    user.password="sohara"
    assert User.auth(user)," Failure: user auth."
  end
  
  test "user login" do
    user=User.new(:nickname=>"sohara",:password=>"ahoaho")
    #Failure: 
    assert_equal User.login(user),false
    assert_equal user.errors[:nickname][0],I18n.t("users.auth_failure")
    #success
    user.password="sohara"
    assert User.login(user)," Failure: user login."
    assert_equal User.login(user),298486374
  end
   
end
