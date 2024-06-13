[out:json][timeout:60];
{{geocodeArea:Brazil}}->.searchArea;
nwr["amenity"="hospital"](area.searchArea);
out geom;