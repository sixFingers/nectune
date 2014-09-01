class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    begin
      !!URI.parse(value)
    rescue
      record.errors[attribute] << (options[:message] || "is not a valid url")
    end
  end
end
