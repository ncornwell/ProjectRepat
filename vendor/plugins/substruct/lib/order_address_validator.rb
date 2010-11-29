# encoding: UTF-8
# Source Code Modifications (c) 2010 Laurence A. Lee, 
# See /RUBYJEDI.txt for Licensing and Distribution Terms
class OrderAddressValidator < ActiveModel::Validator
  US_STATES = %\AK AR AZ CT FL HI IL KY MD MN MT NE NM OH PA SC TX VI WI AL CA DC GA IA IN LA ME  	MO NC NH NV OK PR SD UT VT WV CO DE GU ID KS MA MI MS ND NJ NY OR RI TN VA WA WY\.split( /\W+/ )

  def validate(record)
    if record.country && record.country.name == "United States of America"
      unless record.zip.blank?
        unless record.zip =~ /^\d{5}/
          record.errors[:zip] << "Please enter a valid zip."
        end
      end
      record.state = record.state.upcase
      unless US_STATES.include?(record.state)
        record.errors[:state] << "Please use a US state abbreviation"
      end
    end
  end
end
