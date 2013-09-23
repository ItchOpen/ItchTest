SELECT p.id AS pnng_id
,      p.gbkr_id
,      p.gbkr_id_2
,      g.naam AS gebruiker
,      p.opmerking
,      t.omschrijving AS training
,      IFNULL(o1.code, o2.code) AS opleiding
,      CONCAT(IF(r.kolom_onderschrift = '', '', CONCAT(r.kolom_onderschrift, ' - ')), r.omschrijving) AS voertuig
,      CONCAT(th.omschrijving, ' (', th.code, ')') AS theorie_opleiding
,      p.planning_soort
,      substr(p.begintijd, 1, 5) AS begintijd
,      substr(p.bevg_eindtijd_ochtend, 1, 5) AS bevg_eindtijd_ochtend
,      substr(p.bevg_begintijd_middag, 1, 5) AS bevg_begintijd_middag
,      substr(p.eindtijd, 1, 5) AS eindtijd
,      CONCAT(l.straat, ' ', l.huisnummer, IF(l.huisnummer_toevoeging = '', '', CONCAT(' ', l.huisnummer_toevoeging)), IF(l.plaats = '', '', CONCAT(', ', l.plaats))) AS les_locatie_omschrijving
,      l.omschrijving AS les_locatie
,      r.kolom
,      r.kolom_onderschrift
FROM   planning_externe_locatie AS p
LEFT JOIN gebruiker AS g ON (p.gbkr_id = g.id OR p.gbkr_id_2 = g.id)
LEFT JOIN gebruiker_training AS t ON p.grtg_id = t.id
LEFT JOIN theorie_opleiding AS th ON p.teog_id = th.id
LEFT JOIN gebruiker_pnng_week_rij AS r ON p.gpwr_id = r.id
LEFT JOIN gebruiker_les_locatie AS l ON p.glle_id = l.id
LEFT JOIN gebruiker_opleiding AS o1 ON r.grog_id = o1.id
LEFT JOIN gebruiker_opleiding AS o2 ON l.grog_id = o2.id
WHERE  p.plan_datum = '2012-11-19'
AND  (o1.ghle_id = 2
			OR
			o2.ghle_id = 2
			OR
			p.opmerking != ''
			)
ORDER BY p.begintijd


/* TOON ROOSTER(s) van INSTRUCTEURS */
SELECT p.id
,      p.gbkr_id
,      p.gbkr_id_2
,      p.opmerking
,      p.gtrg_id
,      t.omschrijving AS training
,      IFNULL(o1.code, o2.code) AS opleiding
,      CONCAT(IF(r.kolom_onderschrift = '', '', CONCAT(r.kolom_onderschrift, ' - ')), r.omschrijving) AS voertuig
,      CONCAT(th.omschrijving, ' (', th.code, ')') AS theorie_opleiding
,      p.planning_soort
,      p.begintijd
,      p.bevg_eindtijd_ochtend
,      p.bevg_begintijd_middag
,      p.eindtijd
,      CONCAT(l.straat, ' ', l.huisnummer, IF(l.huisnummer_toevoeging = '', '', CONCAT(' ', l.huisnummer_toevoeging)), ', ', l.plaats) AS les_locatie_omschrijving
,      l.omschrijving AS les_locatie
,      r.kolom
,      r.kolom_onderschrift
FROM   planning_externe_locatie AS p
LEFT JOIN gebruiker AS g ON (p.gbkr_id = g.id OR p.gbkr_id_2 = g.id)
LEFT JOIN gebruiker_training AS t ON p.grtg_id = t.id
LEFT JOIN theorie_opleiding AS th ON p.teog_id = th.id
LEFT JOIN gebruiker_pnng_week_rij AS r ON p.gpwr_id = r.id
LEFT JOIN gebruiker_les_locatie AS l ON p.glle_id = l.id
LEFT JOIN gebruiker_opleiding AS o1 ON r.grog_id = o1.id
LEFT JOIN gebruiker_opleiding AS o2 ON l.grog_id = o2.id
WHERE  p.plan_datum = '2012-11-20'
AND    (g.id = 38
				OR
				p.opmerking != ''
			 )
ORDER BY id

/* TOON KANDIDATEN per ROOSTER */
SELECT k.*
FROM   planning_externe_locatie AS p
INNER JOIN kandidaat_traject AS t ON p.kttt_id = t.id
INNER JOIN kandidaten AS k ON t.kddt_id = k.id
WHERE  p.pgbk_id = 23527
ORDER BY p.begintijd, k.achternaam




SELECT p.id AS pnng_id
,      p.gbkr_id
,      p.gbkr_id_2
,      p.opmerking
,      t.omschrijving AS training
,      IFNULL(o1.code, o2.code) AS opleiding
,      CONCAT(IF(r.kolom_onderschrift = '', '', CONCAT(r.kolom_onderschrift, ' - ')), r.omschrijving) AS voertuig
,      CONCAT(th.omschrijving, ' (', th.code, ')') AS theorie_opleiding
,      p.planning_soort
,      substr(p.begintijd, 1, 5) AS begintijd
,      substr(p.bevg_eindtijd_ochtend, 1, 5) AS bevg_eindtijd_ochtend
,      substr(p.bevg_begintijd_middag, 1, 5) AS bevg_begintijd_middag
,      substr(p.eindtijd, 1, 5) AS eindtijd
,      CONCAT(l.straat, ' ', l.huisnummer, IF(l.huisnummer_toevoeging = '', '', CONCAT(' ', l.huisnummer_toevoeging)), IF(l.plaats = '', '', CONCAT(', ', l.plaats))) AS les_locatie_omschrijving
,      l.omschrijving AS les_locatie
,      r.kolom
,      r.kolom_onderschrift

FROM   planning_externe_locatie AS p
kandidaten

LEFT JOIN gebruiker AS g ON (p.gbkr_id = g.id OR p.gbkr_id_2 = g.id)
LEFT JOIN gebruiker_training AS t ON p.grtg_id = t.id
LEFT JOIN theorie_opleiding AS th ON p.teog_id = th.id
LEFT JOIN gebruiker_pnng_week_rij AS r ON p.gpwr_id = r.id
LEFT JOIN gebruiker_les_locatie AS l ON p.glle_id = l.id
LEFT JOIN gebruiker_opleiding AS o1 ON r.grog_id = o1.id
LEFT JOIN gebruiker_opleiding AS o2 ON l.grog_id = o2.id
WHERE  p.plan_datum = '2012-11-19'
AND    (g.id = 43
				OR
				p.opmerking != ''
			 )



ORDER BY p.begintijd