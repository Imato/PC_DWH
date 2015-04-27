CREATE PARTITION SCHEME [ps_date_year]
	AS PARTITION pf_date_year
	TO ([fact_2011], [fact_2012], [fact_2013], [fact_2014], [fact_2015])
