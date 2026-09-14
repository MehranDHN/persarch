# Jameh Mosque of Isfahan — GraphDB case study

CIDOC CRM + CRMba + BOT sample graph ready to load into [Ontotext GraphDB](https://www.ontotext.com/products/graphdb/).

## What you import

| File | Named graph | Contents |
|---|---|---|
| `rdf/00-crm-crmba-subset.ttl` | `http://www.cidoc-crm.org/cidoc-crm/` | CRM / CRMba classes and properties used here |
| `rdf/01-bot.ttl` | `https://w3id.org/bot` | Official Building Topology Ontology |
| `rdf/02-jame-schema.ttl` | `https://example.org/jame-isfahan/graph/schema` | Application classes, roles, AAT/Wikidata types |
| `rdf/03-jame-data.ttl` | `https://example.org/jame-isfahan/graph/data` | Mosque, parts, actors, campaigns |

Named graphs keep schema and data separable in Explore → Graphs overview.

## 1. Install GraphDB

Any of these works:

- GraphDB Free desktop from https://www.ontotext.com/products/graphdb/graphdb-free/
- Docker:

```bash
docker run -d --name graphdb -p 7200:7200 ontotext/graphdb:10.8.4
```

Open http://localhost:7200

## 2. Create the repository

**Workbench**

1. Setup → Repositories → Create new repository.
2. Repository ID: `jame-isfahan`
3. Ruleset: **RDFS-Plus (Optimized)** — not OWL-Horst.
4. Enable context index: on.
5. Disable owl:sameAs: on.
6. Create.

Or upload `config/graphdb-repo.ttl` if your GraphDB version accepts a config file.

Why RDFS-Plus and sameAs off:

- CRM is an event model, not a closed OWL-DL TBox. OWL-Horst plus the official Erlangen restrictions over-infers.
- External IDs in this dataset are `skos:exactMatch`, not `owl:sameAs`, so Wikidata IRIs are not merged into local nodes.

## 3. Register prefixes

Setup → Namespaces. Add every row from `config/namespaces.tsv`, or paste:

```
crm     http://www.cidoc-crm.org/cidoc-crm/
crmba   http://www.cidoc-crm.org/extensions/crmba/
bot     https://w3id.org/bot#
jame    https://example.org/jame-isfahan/
aat     http://vocab.getty.edu/aat/
wd      http://www.wikidata.org/entity/
```

## 4. Import RDF

Import → User data → Upload RDF files.

Upload in this order and set the named graph for each file:

1. `00-crm-crmba-subset.ttl` → graph `http://www.cidoc-crm.org/cidoc-crm/`
2. `01-bot.ttl` → graph `https://w3id.org/bot`
3. `02-jame-schema.ttl` → graph `https://example.org/jame-isfahan/graph/schema`
4. `03-jame-data.ttl` → graph `https://example.org/jame-isfahan/graph/data`

Import settings:

- Base IRI: `https://example.org/jame-isfahan/`
- Preserve BNodes: off (there are none)

Expect on the order of **2–3k explicit statements** plus a few hundred inferred RDFS triples. BOT is the bulk of the schema graph.

### Alternative: curl

```bash
cd graphdb-jame
chmod +x scripts/import.sh
GRAPHDB=http://localhost:7200 REPO=jame-isfahan ./scripts/import.sh
```

If the Workbench has security enabled:

```bash
GRAPHDB_AUTH=admin:root ./scripts/import.sh
```

## 5. Check the load

SPARQL → write a new tab → open `queries/01-counts.rq`.

You should see events, productions, persons, sections and spaces all non-zero.

Explore → Class hierarchy should show `E12 Production` under `E11 Modification` under `E7 Activity`, and `jame:MosqueComplex` under both `B1 Built Work` and `bot:Building`.

## 6. Case-study queries

Copy each file from `queries/` into a SPARQL tab and save it (star icon).

| Query | Question the graph answers |
|---|---|
| `01-counts.rq` | Did the import work? |
| `02-timeline.rq` | Campaign sequence with actors and products |
| `03-who-commissioned.rq` | Patron vs designer vs workshop |
| `04-south-iwan-biography.rq` | Event biography of one morphological section |
| `05-addition-removal.rq` | Timurid hall added, then partly removed |
| `06-inscriptions.rq` | `E34` texts carried by fabric |
| `07-spaces-bot.rq` | BOT topology next to CRMba sections |
| `08-visual-graph-construct.rq` | Compact neighbourhood around the mosque |

## 7. Visual Graph

Explore → Visual graph → Advanced graph configuration:

- Start node: `https://example.org/jame-isfahan/mosque`
- Incoming / outgoing links to include:

```
crm:P108_has_produced
crm:P31_has_modified
crm:P14_carried_out_by
jame:commissionedBy
jame:designedBy
jame:executedBy
jame:hasCampaign
crmba:BP1_is_section_of
crm:P128_carries
bot:hasSpace
bot:hasElement
crm:P4_has_time-span
```

- Preferred label: `rdfs:label`
- Max links per node: 20

The south-iwan start node `https://example.org/jame-isfahan/part_south_iwan` is the clearest single-section picture (Seljuq body, Aq Qoyunlu tile, Safavid minarets).

## 8. Optional: load full Erlangen CRM later

Do this only if you need the complete CRM class tree.

1. Download https://raw.githubusercontent.com/erlangen-crm/ecrm/master/ecrm_current.owl
2. Import into a **separate** named graph, still with RDFS-Plus.
3. Keep `disable-sameAs = true`.

Do not switch the repo to `owl-horst-optimized` after that load.

## 9. Talking points for the case study

- The mosque is one `B1` / `bot:Building`; each campaign is an `E12`/`E11`/`E79`/`E80`.
- `skos:exactMatch` links AAT and Wikidata without owl:sameAs identity collapse.
- `jame:commissionedBy` is a subproperty of `P14`, so RDFS-Plus infers the generic CRM participation triple.
- The Safavid winter hall is both `E12 Production` and `E80 Part Removal` — that is the palimpsest test.
- BOT `hasSpace` describes the present plan; CRMba `BP1` plus events describe how the plan was made.

## File layout

```
graphdb-jame/
  README.md
  config/graphdb-repo.ttl
  config/namespaces.tsv
  rdf/00-crm-crmba-subset.ttl
  rdf/01-bot.ttl
  rdf/02-jame-schema.ttl
  rdf/03-jame-data.ttl
  queries/*.rq
  scripts/import.sh
```
