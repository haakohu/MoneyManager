class TransactionValidator < ActiveModel::Validator

  def validate(record)
    if(record.from.id == record.to.id)
      record.errors[:base] << "The from account can't be the same as the to account"
    end
  end

end
