class ReferenceTask < ActiveRecord::Base
	enum assigned_person: [:couple, :bride, :groom]

	WEDDING_CASE = [
		:wedding_in_more_than_12_months,
		:wedding_in_12_months,
		:wedding_in_11_months,
		:wedding_in_10_months,
		:wedding_in_9_months,
		:wedding_in_8_months,
		:wedding_in_7_months,
		:wedding_in_6_months,
		:wedding_in_5_months,
		:wedding_in_4_months,
		:wedding_in_3_months,
		:wedding_in_2_months,
		:wedding_in_1_month
	]

	PERIODS_MAP = [
		:more_than_12_months,
		:btw_11_and_12_months,
		:btw_10_and_11_months,
		:btw_9_and_10_months,
		:btw_7_and_8_months,
		:btw_5_and_6_months,
		:in_12_months,
		:in_11_months,
		:in_10_months,
		:in_9_months,
		:in_8_months,
		:in_7_months,
		:in_6_months,
		:in_5_months,
		:in_4_months,
		:in_3_months,
		:in_2_months,
		:in_1_month,
		:in_15_days,
		:in_1_week,
		:day_before,
		:d_day,
		:after,
		:no,
		:finished
	]

	enum_without_methods wedding_in_more_than_12_months: PERIODS_MAP
	enum_without_methods wedding_in_12_months: PERIODS_MAP
	enum_without_methods wedding_in_11_months: PERIODS_MAP
	enum_without_methods wedding_in_10_months: PERIODS_MAP
	enum_without_methods wedding_in_9_months: PERIODS_MAP
	enum_without_methods wedding_in_8_months: PERIODS_MAP
	enum_without_methods wedding_in_7_months: PERIODS_MAP
	enum_without_methods wedding_in_6_months: PERIODS_MAP
	enum_without_methods wedding_in_5_months: PERIODS_MAP
	enum_without_methods wedding_in_4_months: PERIODS_MAP
	enum_without_methods wedding_in_3_months: PERIODS_MAP
	enum_without_methods wedding_in_2_months: PERIODS_MAP
	enum_without_methods wedding_in_1_month: PERIODS_MAP

	#we created 13 different wedding scenarii
	def self.determine_wedding_case wedding_date
		month_number = ((wedding_date - Date.today) / 30.4).round
    if month_number > 12
      :wedding_in_more_than_12_months
    elsif month_number <= 12 && month_number >= 1
      ("wedding_in_#{month_number}_months").to_sym
    elsif month_number == 0
      :wedding_in_1_month
    end
	end
end
