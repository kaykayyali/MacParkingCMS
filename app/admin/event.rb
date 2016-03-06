ActiveAdmin.register Event do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :event_name, :guest_count, :sales_person, :event_type, :contact_name, :contact_number,
 :street_address, :zipcode, :city, :state, :price, :paid, :notes, :start_time, :end_time, :date, :excel_file, :excelfile, :avatar
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
