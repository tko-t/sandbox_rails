class Member < ApplicationRecord
  belongs_to :family, optional: true, touch: true

  validate :some_validation

  def some_validation
    errors.add('error') if name&.include?('hoge')
  end

  module CallbackCheck
    class << self
      def callback_kinds
        {
          before: %i[validation save create update destroy],
          after:  %i[validation save create update destroy commit rollback initialize find],
          around: %i[save create update destroy]
        }
      end

      def included(k)
        callback_kinds.each do |timing, actions|
          actions.each do |action|
            cb = "#{timing}_#{action}"
            cb_method = "callback_#{timing}_#{action}"
            k.define_method cb_method do |&block|
              puts cb
              block.call if block && timing == :around
            end
            k.send(cb.to_sym, cb_method.to_sym)
          end
        end
      end
    end
  end

  include CallbackCheck
end
