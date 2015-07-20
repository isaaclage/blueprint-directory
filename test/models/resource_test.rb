require 'test_helper'

class ResourceTest < ActiveSupport::TestCase

  def setup
    @resource = Resource.new(name: "Example Resource", email: "resource@example.com")
  end
                             
  test "should be valid" do
    assert @resource.valid?
  end

  test "name should be present" do
    @resource.name = "  "
    assert_not @resource.valid?
  end

  test "email should be present" do
    @resource.email = "  "
    assert_not @resource.valid?
  end

  test "name should not be too long" do
    @resource.name = "a" * 51
    assert_not @resource.valid?
  end

  test "email should not be too long" do
    @resource.email = "a" * 244 + "@example.com"
    assert_not @resource.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[resource@example.com RESOURCE@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alic+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @resource.email = valid_address
      assert @resource.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[resource@example,com resource_at_foo.org resource.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @resource.email = invalid_address
      assert_not @resource.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_resource = @resource.dup
    duplicate_resource.email = @resource.email.upcase
    @resource.save
    assert_not duplicate_resource.valid?
  end
end
