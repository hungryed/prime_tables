module PrimeTables
  class Errors
    class BaseError < StandardError; end
    class InvalidNumber < BaseError; end
    class InvalidDisplayType < BaseError; end
  end
end
