{% snapshot snap_customer_addressess %}

{{
config(

target_schema = 'SNAPSHOTS',
target_database = 'Dev_Analaytics',
unique_key = 'address_id',
strategy = 'check',
check_cols = ['street','city','state','pincode','is_default']
)

}}
select address_id, customer_id, address_type, street, city,state,pincode, is_default
from  {{ source('customers','customer_address')}}

{% endsnapshot %}
