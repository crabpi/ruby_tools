require 'bertrem'

module Calc
  def add(a, b)
    a + b
  end
end

EM.run {
  BERTREM::Server.expose(:calc, Calc)
  svc = BERTREM::Server.start('localhost', 9999)
}
