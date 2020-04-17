CREATE OR REPLACE FUNCTION haversine(
  latitude1 NUMERIC(15,13), longitude1 NUMERIC(15,13),
  latitude2 NUMERIC(15,13), longitude2 NUMERIC(15,13)
)
RETURNS DOUBLE PRECISION AS
$BODY$
  SELECT 6371 * ACOS(
                        COS(RADIANS(latitude1))
                      * COS(RADIANS(latitude2))
                      * COS(RADIANS(longitude1) - RADIANS(longitude2))
                      + SIN(RADIANS(latitude1))
                      * SIN(RADIANS(latitude2))
                    ) AS distance
$BODY$
LANGUAGE SQL
