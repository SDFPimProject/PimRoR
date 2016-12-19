class MessageValidator < ActiveModel::Validator
    def validate(record)

        if !record.is_send && record.is_receive
            record.errors[:is_receive] << 'is_receive could not be true before is_send'
        end
        if !record.is_receive && record.is_read
            record.errors[:is_read] << 'is_read could not be true before is_receive'
        end
        if record.encrypted_body.length == 0
            record.errors[:encrypted_body] << 'encrypted_body can not be empty'
        end
    end
end