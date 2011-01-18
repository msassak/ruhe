require 'patron'

When /^(.+) receives (\w+)$/ do |resource, method|
  ruhe.apply(method, resource)
end

When /^(.+) receives (\w+) with:$/ do |resource, method, body|
  ruhe.apply(method, resource, :body => body)
end

Then /^it responds (\d+\s\w+) with:$/ do |status, body|
  # TODO: ruhe.should respond_with(status, body)
  ruhe.response_status.should =~ /#{status}$/
  ruhe.response_body.should == body
end

Then /^it responds (\d+\s\w+)$/ do |status|
  ruhe.response_status.should =~ /#{status}$/
end

module Ruhe
  class Session
    def initialize(base_url)
      @client = Patron::Session.new
      @client.base_url = base_url
    end

    def apply(method, resource, opts={})
      args = {
        'GET' => [:get, resource],
        'POST' => [:post, resource, opts[:body]]
      }[method]

      @response = @client.send(*args)
    end

    def get(resource)
      apply('GET', resource)
    end

    def post(resource, body)
      apply('POST', resource, body)
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
