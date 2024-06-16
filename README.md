# dados-abertos-hospitais
(rascunho) Dados abertos sobre estabelecimentos de no Brasil. Baseado CNES do Datasus, Wikidata e OpenStreetMap


## TL;DR
- <ftp://ftp.datasus.gov.br/cnes/>
  - https://cnes.datasus.gov.br/pages/estabelecimentos/consulta.jsp
- https://w.wiki/ANuX
- https://overpass-turbo.eu/s/1MRX

## Fontes de dados

### Governo

### DATASUS - Ministério da Saúde
- Formulário Web: https://cnes.datasus.gov.br/pages/estabelecimentos/consulta.jsp
- Dados abertos: <ftp://ftp.datasus.gov.br/cnes/>
  - 

### Wikies

#### Wikidata

- https://w.wiki/ANuX

```
# instance_of=hospital (Q16917) health care facility, for individual buildings use hospital building, for organizations use medical organization
SELECT DISTINCT ?item ?itemLabel ?countryLabel ?jurisdictionLabel ?operating_areaLabel ?official_website WHERE {
  VALUES ?instances_of {
    wd:Q16917
  }
  ?item (p:P31/ps:P31/(wdt:P279*)) ?instances_of;
    wdt:P17 ?country;
    p:P17 ?statement1.
  ?statement1 ps:P17 wd:Q155.  # Q155 = Brazil; Change here to select another country
  OPTIONAL { ?item wdt:P1001 ?jurisdiction. }
  OPTIONAL { ?item wdt:P2541 ?operating_area. }
  OPTIONAL { ?item wdt:P856 ?official_website. }
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE],pt,en,de,fr,ru,es,ja,zh,ar". }
}
ORDER BY (?countryLabel) (?jurisdictionLabel) (?operating_areaLabel)
LIMIT 5000
```

#### OpenStreetMap

- https://overpass-turbo.eu/s/1MRX

```c
[out:json][timeout:60];
{{geocodeArea:Brazil}}->.searchArea;
nwr["amenity"="hospital"](area.searchArea);
out geom;
```

<!--
https://www.wikidata.org/wiki/Wikidata:WikiProject_Medicine/Hospitals_by_country/Brazil
-->