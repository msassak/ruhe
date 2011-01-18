require 'patron'

When /^(.+) receives GET$/ do |resource|
  ruhe.get resource
end

Then /^it responds (\d+\s\w+) with:$/ do |status, body|
  # TODO: ruhe.should respond_with(status, body)
  ruhe.response_status.should =~ /#{status}$/
  ruhe.response_body.should == body
end

module Ruhe
  class Session
    def initialize(base_url)
      @client = Patron::Session.new
      @client.base_url = base_url
    end

    def get(resource)
      @response = @client.get(resource)
    end

    def response_body
      @response.body.chomp
    end

    def response_status
      @response.status_line
    end
  end

  attr_reader :ruhe
  def self.extended(base)
    raise "Can't continue unless Ruhe.base_url is set" unless Ruhe.base_url
    base.instance_variable_set(:@ruhe, Session.new(Ruhe.base_url))
  end

  class << self
    attr_accessor :base_url
  end
end

World(Ruhe)
