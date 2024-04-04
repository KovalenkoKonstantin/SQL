create table Account_Analysis_44
(
	account_analysis_44_value decimal(8,2),
	[1C_article_id] int
		constraint FK_Account_Analysis_44_Names_of_Articles_in_1C_1C_article_id
			references Names_of_Articles_in_1C,
	year_id int
		constraint FK_Account_Analysis_44_Year_year_id
			references Year,
	month_id int
		constraint FK_Account_Analysis_44_Month_month_id
			references Month,
	organization_id int
		constraint FK_Account_Analysis_44_Organization_organization_id
			references Organization
)
go