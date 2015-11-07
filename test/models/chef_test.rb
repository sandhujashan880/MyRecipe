require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
  @chef= Chef.new(chefname:"jashan", email:"jashansandhu880@gmail.com")
  
  end
  
    test "chef should be valid" do
  
    assert @chef.valid?
    end
  
    test "chef name should be present" do
  
    @chef.chefname= " "
    assert_not @chef.valid?
    end
    
    test "chef name should not be too long" do
      @chef.chefname= "a" * 41
      assert_not @chef.valid?
    end
    
    test "chefname should not be too short" do
      @chef.chefname= "a" * 2
      assert_not @chef.valid?
    end
    
    test "email should be present" do
      @chef.email=""
      assert_not @chef.valid?
    end
    
    test "emal should be in bounds" do
      @chef.email= "a" * 101 + "@example.com"
      assert_not @chef.valid?
    end
  
  test "email address should unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email should accept be valid address" do
   valid_emails= %w[abc@eee.com ABC_dd-w@eee.com aaa@gmail.com abc123@gmail.com]
   valid_emails.each do |va|
     @chef.email = va 
     assert @chef.valid?, '#{va.inspect} is a valid email address'
   end
  end
  
  
  test "email should reject be invalid address" do
   invalid_emails= %w[abc.com abc123.org.com abc@com abc 123 @112.]
   invalid_emails.each do |ia|
     @chef.email = ia
     assert_not @chef.valid?, '#{ia.inspect} is a invalid address'
   end
  end
  
end