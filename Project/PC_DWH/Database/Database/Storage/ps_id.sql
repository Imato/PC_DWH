CREATE PARTITION SCHEME [ps_id]
	AS PARTITION pf_id
	TO ([fact_id_100000], [fact_id_200000], [fact_id_300000], [fact_id_400000], [fact_id_500000])