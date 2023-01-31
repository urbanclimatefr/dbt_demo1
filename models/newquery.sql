{{
    config(
            materialized='table'
    )

}}

select 
  provider_id as inpatient_provider_id
, provider_name as inpatient_provider_name
, provider_city as inpatient_provider_city
, provider_state as inpatient_provider_state
, round(sum(total_discharges),2) as inpatient_sum_total_discharges
, round(sum(average_covered_charges),2) as inpatient_sum_average_covered_charges
, round(sum(average_total_payments),2) as inpatient_sum_average_total_payments
, round(sum(average_medicare_payments),2) as inpatient_sum_average_medicare_payments
from `bigquery-public-data.cms_medicare.inpatient_charges_2011`
group by 
1, 2, 3, 4