SELECT CONCAT(SUBSTRING(dd.begintijd, 1, 5), 'u-', SUBSTRING(dd.eindtijd, 1, 5), 'u') AS roostertijd
,      CONCAT(bh.voornaam, ' ', bh.achternaam)                                        AS behandelaar
,      br.omschrijving                                                                AS behandelruimte
,      CONCAT(gt.voornaam, ' ', gt.achternaam)                                        AS gast
,      SUBSTRING(pg.start, 1, 5)                                                      AS behandeltijd_start
,      SUBSTRING(pg.einde, 1, 5)                                                      AS behandeltijd_einde
,      sb2.omschrijving                                                               AS behandeling
,      sb2.codering                                                                   AS behandelcode
FROM   behandelgroep        AS bg
INNER JOIN behandelruimte   AS br  ON bg.id = br.blgp_id
LEFT JOIN dagdeel           AS dd  ON br.id = blre_id
LEFT JOIN behandelaar       AS bh  ON dd.behr_id = bh.id
LEFT JOIN planning          AS pg  ON dd.id = pg.dgdl_id
LEFT JOIN gast              AS gt  ON pg.gast_id = gt.id
LEFT JOIN behandeling_vdbp  AS sb1 ON pg.bgvp_id = sb1.id
LEFT JOIN soort_behandeling AS sb2 ON sb1.stbg_id = sb2.id
WHERE  bg.id = 1
AND    dd.datum = '2013-09-07'
ORDER BY br.omschrijving, dd.begintijd, pg.start ASC

UPDATE dagdeel AS a SET
a.datum = '2013-09-09'
WHERE a.id in (25053,25061,25069,25077)


SELECT dd.id
FROM   behandelgroep        AS bg
INNER JOIN behandelruimte   AS br  ON bg.id = br.blgp_id
LEFT JOIN dagdeel           AS dd  ON br.id = blre_id
LEFT JOIN behandelaar       AS bh  ON dd.behr_id = bh.id
LEFT JOIN planning          AS pg  ON dd.id = pg.dgdl_id
LEFT JOIN gast              AS gt  ON pg.gast_id = gt.id
LEFT JOIN behandeling_vdbp  AS sb1 ON pg.bgvp_id = sb1.id
LEFT JOIN soort_behandeling AS sb2 ON sb1.stbg_id = sb2.id
WHERE  bg.id in (1,6)
AND    dd.datum = '2013-09-07'
GROUP BY dd.id


SELECT pg.aantal_gasten
,      sb2.omschrijving AS behandeling
,      sb2.soort
,      sb2.prijs
FROM   behandelgroep        AS bg
INNER JOIN behandelruimte   AS br  ON bg.id = br.blgp_id
LEFT JOIN dagdeel           AS dd  ON br.id = blre_id
LEFT JOIN planning          AS pg  ON dd.id = pg.dgdl_id
LEFT JOIN behandeling_vdbp  AS sb1 ON pg.bgvp_id = sb1.id
LEFT JOIN soort_behandeling AS sb2 ON sb1.stbg_id = sb2.id
WHERE  bg.id           = '1'
AND    dd.datum        = '2013-09-08'
AND    (pg.gast_id != 0 or pg.gast_id != '')
AND    pg.no_show      = 'n'
ORDER BY pg.start