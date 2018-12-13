require 'bertrem'

module Calc
  def add(a, b)
    a + b
  end
end

module Test
  def hello(name)
    "hello #{name}"
  end
end

EM.run {
  BERTREM::Server.expose(:calc, Calc)
  BERTREM::Server.expose(:test, Test)
  svc = BERTREM::Server.start('localhost', 9999)
}
