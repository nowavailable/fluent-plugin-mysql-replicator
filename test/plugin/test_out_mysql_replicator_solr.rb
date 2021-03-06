require 'helper'
require 'fluent/test/driver/output'

class MysqlReplicatorSolrOutput < Test::Unit::TestCase

  def setup
    Fluent::Test.setup
  end

  CONFIG = %[
    host       localhost
    port       8983
    tag_format (?<core_name>[^\.]+)\.(?<event>[^\.]+)\.(?<primary_key>[^\.]+)$
  ]

  def create_driver(conf=CONFIG)
    Fluent::Test::Driver::Output.new(Fluent::Plugin::MysqlReplicatorSolrOutput).configure(conf)
  end

  def test_configure
    d = create_driver(%[])
    assert_equal 'localhost', d.instance.host
    assert_equal 8983, d.instance.port
  end
end
