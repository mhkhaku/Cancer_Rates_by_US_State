-- DROPPING TABLE IF EXISTS

DROP TABLE IF EXISTS  usc_death;
DROP TABLE IF EXISTS usc_incident;

-- CREATING CANCER DEATH TABLE OF US STATE
CREATE TABLE usc_death (
	state VARCHAR,
	range VARCHAR,
	rate NUMERIC
	);
	
-- CREATING CANCER INCIDENT TABLE OF US STATE	
CREATE TABLE usc_incident (
	state_inc VARCHAR,
	range_inc VARCHAR,
	rate_inc NUMERIC
);

SELECT * FROM usc_death;

SELECT * FROM usc_incident;

-- RETRIEVING DEATH RATE OF STATE GREATER THEN 150

SELECT * FROM usc_death
WHERE rate > 150;

-- RETRIEVING RECORDS WHERE INCIDENT RATE IS LESS THEN 150

SELECT * FROM usc_incident
WHERE rate_inc < 150;

-- RETRIEVING RECORDS FROM BOTH TABLE WHERE DEATH & INCIDENT ARE BOTH ABOVE CERTAIN THRESHOLD

SELECT * FROM usc_death
WHERE rate > 175
UNION 
SELECT * FROM usc_incident
WHERE rate_inc > 150;

-- SORTING TABLE BY DEATH RATE

SELECT * FROM usc_death
ORDER BY rate DESC;

-- AVERAGE DEATH RATE FOR ALL STATES

SELECT AVG(rate) AS avg_death_rate FROM usc_death;

-- SELECT MAXIMUM * MINIMUM DEATH RATE FOR ALL STATES

SELECT MAX(rate) AS max_death_rate FROM usc_death
;
SELECT MIN(rate) AS min_death_rate FROM usc_death
;

-- PERFORMING LEFT JOIN BETWEEN DEATH & INCIDENT TABLE TO RETRIEVE ALL RECORDS


SELECT 
	d.state, 
	d.range, 
	d.rate AS death_rate, 
	i.range_inc AS incident_range, 
	i.rate_inc AS incident_rate
FROM 
	usc_death AS d
LEFT JOIN 
	usc_incident AS i 
ON 
	d.state = i.state_inc
;