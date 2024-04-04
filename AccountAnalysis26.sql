create table Account_Analysis_26
(
	account_analysis_26_value decimal(8,2),
	[1C_article_id] int
		constraint FK_Account_Analysis_26_Names_of_Articles_in_1C_1C_article_id
			references Names_of_Articles_in_1C,
	year_id int
		constraint FK_Account_Analysis_26_Year_year_id
			references Year,
	month_id int
		constraint FK_Account_Analysis_26_Month_month_id
			references Month,
	organization_id int
		constraint FK_Account_Analysis_26_Organization_organization_id
			references Organization
)
go