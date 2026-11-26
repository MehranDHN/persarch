# Wikidata as a Complementary Authority for Persian Architecture

*Working report — initial review 25 November 2026; case-study profiles refreshed 26 November 2026*

## Executive summary

Wikidata can be a useful complementary source for Persian architectural heritage: it provides persistent item identifiers, multilingual labels, links to external authorities, structured relationships, and queryable data. It should not be treated as an authoritative source of truth or as a substitute for scholarly and institutional sources. Wikidata is collaboratively edited, unevenly sourced, and incomplete; a query returning a value does not establish that the value is correct, and a missing value does not establish that the fact is false.

![Persian Architectural Heritage Wikidata Guide](/images/Persian_Architectural_Heritage_Wikidata_Guide.jpg)

For this project, the safest role is as a **discovery, reconciliation, and enrichment layer**. Verify significant claims against sources appropriate to the claim, retain provenance in the local dataset, and treat harvested Wikidata values as candidates until reviewed. This report is an initial assessment, not a complete audit of Persian-architecture coverage. The subject-term inventory and quality checks should be expanded as additional concepts are identified.

## 1. Scope and project context

This report considers how Wikidata could complement the Persian Architecture Digital Resources project. The project ontology defines `mdhn:CHABuilding`, `mdhn:VisualArtwork`, and `mdhn:SubjectTerm`; it relates buildings to digital objects and visual artworks to subject terms. The ontology file reviewed for this report does not currently contain Wikidata QID mappings, AAT/LCSH identifier properties, or `skos:exactMatch` / `skos:closeMatch` statements. Those are possible future integrations, not implemented features.

The local model provides a useful starting point for linking resources and monuments, but it does not yet describe all the distinctions needed for reliable crosswalks. In particular, a local subject term should not be mapped to a Wikidata item merely because their labels look alike. Check the meaning, scope, language, and entity type on both sides before asserting a match.

## 2. What Wikidata contributes — and what it does not

Wikidata can contribute:

- **Persistent identifiers:** QIDs make it easier to disambiguate a monument or concept across datasets.
- **Multilingual metadata:** Items may have labels and descriptions in Persian and other languages. Coverage varies by item and should be measured rather than assumed.
- **External authority links:** Properties such as AAT ID (P1014) and Library of Congress Authorities ID (P244) can help with reconciliation. An identifier statement is a lead to inspect, not proof that two concepts have identical scope.
- **Structured claims:** Properties can express types, locations, materials, architects, heritage designations, and relationships between entities, where those statements exist.
- **Query access:** SPARQL can support scoped discovery and quality checks. The Query Service is a public service with operational limits and a dataset that may not be fully current.

Wikidata does **not** guarantee comprehensive coverage, scholarly consensus, a source for every claim, consistent classification, complete Persian labels, or stable availability of a particular query endpoint. Its image links also do not by themselves guarantee a usable IIIF manifest, suitable rights, or adequate descriptive metadata.

## 3. Initial sample of relevant items

The following labels and identifiers were checked against Wikidata on 25 November 2026. This is a small illustrative sample, not a coverage assessment. Re-check item statements before using them in production or publishing a mapping.

| Concept | Wikidata item | Persian label observed | External identifier observed |
|---|---|---|---|
| Mosque | [Q32815](https://www.wikidata.org/wiki/Q32815) | مسجد | AAT IDs `300007544` and `300312246`; inspect each target and scope before selecting one |
| Caravanserai | [Q186347](https://www.wikidata.org/wiki/Q186347) | کاروانسرا | AAT `300007148`; LCSH `sh85020066` |
| Iwan | [Q636232](https://www.wikidata.org/wiki/Q636232) | ایوان | AAT `300075830` |
| Muqarnas | [Q1356021](https://www.wikidata.org/wiki/Q1356021) | مقرنس | AAT `300081762` |
| Dome | [Q12493](https://www.wikidata.org/wiki/Q12493) | گنبد | AAT `300001280`; LCSH `sh85038905` |
| Monument | [Q4989906](https://www.wikidata.org/wiki/Q4989906) | یادمانی | AAT `300006958`; LCSH `sh85087089` |
| Madrasa | [Q132834](https://www.wikidata.org/wiki/Q132834) | مدرسه اسلامی | AAT IDs `300006563` and `300343428`; LCSH `sh96009872` |
| Cultural property | [Q2065736](https://www.wikidata.org/wiki/Q2065736) | اموال فرهنگی | AAT `300055593`; LCSH `sh97000183` |
| Architectural ensemble | [Q1497375](https://www.wikidata.org/wiki/Q1497375) | مجموعه معماری | No AAT ID or LCSH ID observed |
| Imamzadeh | [Q136868](https://www.wikidata.org/wiki/Q136868) | امامزاده | No AAT ID or LCSH ID observed |
| Mausoleum | [Q162875](https://www.wikidata.org/wiki/Q162875) | آرامگاه یادمانی | AAT `300005891`; LCSH `sh85082332` |
| Sufi lodge | [Q833913](https://www.wikidata.org/wiki/Q833913) | خانقاه | AAT `300000665`; LCSH `sh00001752` |

These examples show potential for multilingual lookup and authority reconciliation across building types, architectural concepts, and heritage classifications. They do not establish that every identifier is an exact conceptual match, that every item has adequate references, or that the selected items cover Persian architectural usage. For example, “dome” and *gonbad* may not have identical scope in every scholarly or local context. Wikidata also records materials used in or associated with individual sites through `material` (P186); see the examples in Section 6. A listed material should not be assumed to be exhaustive or to describe every component of a complex.

## 4. Data-quality weaknesses and risks

### 4.1 Uneven sourcing and provenance

Some claims may have no reference, a weak reference, or a reference that does not support the exact value asserted. A citation attached to one statement does not validate all statements on the item. For research use, inspect references at the statement level and prefer sources that directly support the particular claim. Wikidata's [Help:Sources](https://www.wikidata.org/wiki/Help:Sources) describes references such as “stated in” (P248) and “reference URL” (P854). Its [Verifiability page](https://www.wikidata.org/wiki/Wikidata:Verifiability) is marked as a proposed policy or guideline; do not describe it as an adopted policy.

### 4.2 Ambiguous identity and terminology

Monument names can vary by language, transliteration, historical period, and local usage. Similar names can refer to different buildings, while one complex can be represented as a site, a building, or several component structures. A label match alone is not sufficient entity resolution. Preserve aliases and document the evidence used to select an item.

Architectural terms also have contextual meanings. A class hierarchy may flatten distinctions between a spatial form, a structural system, a decorative technique, and a building component. Terms such as iwan, pishtaq, dome, and muqarnas should be reviewed against domain literature before mapping or changing their classification.

### 4.3 Inconsistent or overly broad class relationships

The Wikidata model permits multiple `subclass of` (P279) statements, but not every parent is equally useful for a domain-specific hierarchy. Some statements may be overly broad, confusing, or questionable. Property constraints can flag unusual uses, but Wikidata documents them as guidance with possible exceptions, not as automatic proof of an error ([Property constraints](https://www.wikidata.org/wiki/Help:Property_constraints)).

Also distinguish:

- `instance of` (P31): an individual monument is an instance of a class.
- `subclass of` (P279): one class is a subtype of another class.
- `part of` (P361) and `has part(s)` (P527): relationships between a component and a whole; their direction is not interchangeable.

Do not use a class hierarchy as a substitute for modeling a particular monument's physical composition.

### 4.4 Incomplete language and coverage

Persian labels, descriptions, aliases, and local-language terminology are not uniformly present. Coverage should be measured over a defined set of relevant items and fields. Counts such as “hundreds of sites” or claims of “rich Persian coverage” should not be used without a reproducible query, a defined scope, and a retrieval date.

### 4.5 External identifiers and mappings

External identifiers can be missing, duplicated, outdated, or mapped to a broader or narrower concept than the Wikidata item. A matching identifier should be followed to the authority record and checked for scope. Use `skos:exactMatch` only where equivalence is defensible; use a weaker mapping or no mapping where scope differs. Do not copy external identifiers into the local ontology without retaining their source and review status.

### 4.6 Change, query-service, and media risks

Wikidata statements can change, and the query service is not guaranteed to provide a real-time or complete view. Store retrieval dates and, where practical, item revision identifiers or snapshots for reproducibility. Handle query failures, timeouts, and incomplete results as failures rather than silently treating them as empty data.

The Wikidata Query Service is migrating from Blazegraph to QLever. As of the review date, Wikidata documentation says the v2 endpoints became available on 23 November 2026, v1 is expected to remain available through June 2027, and v1 performance changes are planned from February 2027. Review the [migration guidance](https://www.wikidata.org/wiki/Wikidata:SPARQL_query_service/WDQS_backend_update) before building a scheduled pipeline.

Commons image statements (P18) are not equivalent to IIIF manifests. Before using an image, check its Commons record, license and attribution requirements, file availability, and whether a suitable IIIF service exists.

## 5. Initial hierarchy checks: candidates for review, not confirmed errors

A live query of direct `subclass of` statements on 25 November 2026 surfaced the following items for domain review:

| Item and observed statement | Why review it | Recommended treatment |
|---|---|---|
| Mosque (Q32815) has `subclass of` “organization” (Q43229), among other parents. | “Organization” appears semantically unusual for a building/place-of-worship class and could be a modeling error or an unintended broad classification. | Check the statement's reference, rank, history, and intended meaning against reliable sources and Wikidata community guidance. Do not remove it solely because it looks odd. |
| Iwan (Q636232) is directly classified as a portal (Q854429). | This may capture one aspect while omitting its spatial and structural functions. | Review the item definition and domain literature. Propose additional or more precise parents only if they are supported and fit Wikidata's class model. |
| Muqarnas (Q1356021) is directly classified as a corbel (Q12537). | This may not fully express the architectural system or ornament's uses. | Check sources and item history before proposing a broader or additional parent; do not assume that “vaulting system” is automatically the correct replacement. |

These are **review candidates**, not findings that the statements are definitively false. The hierarchy is a live dataset and may change after this review. A correction should be based on evidence, not on a preferred local model alone.

## 6. Multiple inheritance and multiple classification

Wikidata models a hierarchy as a graph, not an exclusive single-parent tree. A class can have multiple direct `subclass of` (P279) statements, and an individual item can have multiple `instance of` (P31) statements. These are separate relationships: P279 connects classes to broader classes, while P31 classifies an individual item. Multiple statements can express different, compatible aspects of an item; they should not be reduced to one “primary” parent without a specific modeling reason.

The following examples were checked on 25 November 2026. The arrows in the diagram point from the more specific class or individual item to its stated parent or type. P279 and P31 labels are shown explicitly to avoid conflating the two:

```mermaid
flowchart LR
    subgraph Class_hierarchy["Class hierarchy (P279)"]
        monument["monument (Q4989906)"] -->|P279| built["built structure (Q811979)"]
        monument -->|P279| artwork["work of art (Q838948)"]
        madrasa["madrasa (Q132834)"] -->|P279| religiousSchool["religious school (Q1971849)"]
        madrasa -->|P279| schoolBuilding["school building (Q1244442)"]
        culturalProperty["cultural property (Q2065736)"] -->|P279| culturalHeritage["cultural heritage (Q210272)"]
        culturalProperty -->|P279| artificialObject["artificial physical object (Q8205328)"]
    end

    subgraph Item_types["Individual item types (P31)"]
        varamin["Jameh Mosque of Varamin (Q3445267)"] -->|P31| mosque["mosque (Q32815)"]
        varamin -->|P31| culturalProperty
        chaharbagh["Chaharbagh Madrasa (Q5067540)"] -->|P31| madrasa
        chaharbagh -->|P31| mosque
        chaharbagh -->|P31| culturalProperty
        naqsh["Naqsh-e Jahan Square (Q4519)"] -->|P31| square["square (Q174782)"]
        naqsh -->|P31| culturalProperty
        naqsh -->|P31| landmark["architectural landmark (Q2319498)"]
        safi["Sheikh Safi al-Din Shrine Ensemble (Q4243)"] -->|P31| ensemble["architectural ensemble (Q1497375)"]
        safi -->|P31| imamzadeh["imamzadeh (Q136868)"]
        safi -->|P31| mausoleum["mausoleum (Q162875)"]
        safi -->|P31| sufiLodge["Sufi lodge (Q833913)"]
        safi -->|P31| culturalProperty
        yahya["Imamzadeh Yahya, Varamin (Q5939601)"] -->|P31| imamzadeh
        yahya -->|P31| mausoleum
        yahya -->|P31| culturalProperty
        soltaniyeh["Soltaniyeh Dome (Q20645774)"] -->|P31| mausoleum
        soltaniyeh -->|P31| culturalProperty
    end
```

In the class examples, [monument (Q4989906)](https://www.wikidata.org/wiki/Q4989906) has both built structure and work of art as direct P279 parents; [madrasa (Q132834)](https://www.wikidata.org/wiki/Q132834) has religious school and school building; and [cultural property (Q2065736)](https://www.wikidata.org/wiki/Q2065736) has cultural heritage and artificial physical object. These direct statements place each class along more than one conceptual axis. They are Wikidata's recorded classifications, not a claim that every domain ontology should adopt those exact parents.

The individual examples show that P31 can also have multiple direct values: [Jameh Mosque of Varamin (Q3445267)](https://www.wikidata.org/wiki/Q3445267) is typed as both a mosque and a cultural property; [Chaharbagh Madrasa (Q5067540)](https://www.wikidata.org/wiki/Q5067540) as a madrasa, mosque, and cultural property; and [Naqsh-e Jahan Square (Q4519)](https://www.wikidata.org/wiki/Q4519) as a square, cultural property, and architectural landmark. A query or visualization should preserve these direct statements. Do not infer that the square is a subclass of cultural property, or that the madrasa class is a subclass of mosque, from an item's multiple P31 values. Likewise, graph traversal through P279 may find broader ancestors, but those inferred paths should be distinguished from direct claims.

The diagram also adds [Sheikh Safi al-Din Khānegāh and Shrine Ensemble (Q4243)](https://www.wikidata.org/wiki/Q4243), [Imamzadeh Yahya (Varamin) (Q5939601)](https://www.wikidata.org/wiki/Q5939601), and [Soltaniyeh Dome (Q20645774)](https://www.wikidata.org/wiki/Q20645774). Their multiple P31 values demonstrate that Wikidata can classify the same heritage site by different aspects, such as its function, building form, or heritage status.

### Material statements (P186)

Wikidata can attach one or more `material` (P186) values to a site. The following values were present on 25 November 2026:

| Wikidata item | P186 material values observed | Reference note in the checked revision |
|---|---|---|
| [Sheikh Safi al-Din Khānegāh and Shrine Ensemble (Q4243)](https://www.wikidata.org/wiki/Q4243) | [stone (Q22731)](https://www.wikidata.org/wiki/Q22731), [brick (Q40089)](https://www.wikidata.org/wiki/Q40089), [plaster (Q274988)](https://www.wikidata.org/wiki/Q274988), [tile (Q468402)](https://www.wikidata.org/wiki/Q468402), [silver (Q1090)](https://www.wikidata.org/wiki/Q1090) | The silver statement had no reference; the other listed material statements had references. |
| [Imamzadeh Yahya (Varamin) (Q5939601)](https://www.wikidata.org/wiki/Q5939601) | [brick (Q40089)](https://www.wikidata.org/wiki/Q40089), [plaster (Q274988)](https://www.wikidata.org/wiki/Q274988), [tile (Q468402)](https://www.wikidata.org/wiki/Q468402) | Each listed material statement had a reference; the sources still need to be checked for relevance and scope. |
| [Soltaniyeh Dome (Q20645774)](https://www.wikidata.org/wiki/Q20645774) | [brick (Q40089)](https://www.wikidata.org/wiki/Q40089), [mortar (Q189566)](https://www.wikidata.org/wiki/Q189566) | Neither listed material statement had a reference. |

These are statements recorded on the items, not a complete bill of materials or proof that the material applies uniformly to every part of a site. Inspect statement references and, for large complexes, consider whether materials should instead be recorded against specific constituent structures or components.

For the local ontology, decide separately whether a resource is an instance of more than one class and whether one class is a subclass of several others. Preserve the Wikidata property and provenance with each imported relationship, and review whether each asserted type is meaningful for the local use case.

## 7. Ontology perspective: architectural styles and property scope

### 7.1 Architectural-style hierarchy

The item [Q32880](https://www.wikidata.org/wiki/Q32880) is **architectural style** (“visual characteristics of a building”) and is itself a subclass of [art style (Q1792644)](https://www.wikidata.org/wiki/Q1792644). The three style concepts below are related to it by `instance of` (P31), not by `subclass of` (P279). Their direct P279 parents instead place them under architecture of Iran and a dynasty-related art concept:

| Wikidata item | P31 relationship | Direct P279 parents observed |
|---|---|---|
| [Safavid architecture (Q5957125)](https://www.wikidata.org/wiki/Q5957125) | architectural style (Q32880) | architecture of Iran (Q1501585); [Safavid art (Q2366921)](https://www.wikidata.org/wiki/Q2366921) |
| [Timurid architecture (Q16047695)](https://www.wikidata.org/wiki/Q16047695) | architectural style (Q32880) | architecture of Iran (Q1501585); [Timurid art (Q2864747)](https://www.wikidata.org/wiki/Q2864747) |
| [Qajar architecture (Q5718239)](https://www.wikidata.org/wiki/Q5718239) | architectural style (Q32880) | architecture of Iran (Q1501585); [Qajar art (Q2864726)](https://www.wikidata.org/wiki/Q2864726) |

The broader item [architecture of Iran (Q1501585)](https://www.wikidata.org/wiki/Q1501585) is itself directly `subclass of` both Persian art (Q2718840) and architecture of the Earth (Q13152867). This is a multi-parent graph rather than a single, exclusive tree: the P279 links express broader classification, while P31 identifies the concepts as architectural styles. A hierarchy diagram or query should preserve that distinction and should not show Q5957125, Q16047695, or Q5718239 as P279 subclasses of Q32880.

Wikidata also has sequential properties for style chronology: `follows` (P155) states that the subject comes after the value in a sequence, while `followed by` (P156) states that it comes before the value. In the checked statements, Timurid architecture follows Ilkhanid architecture and is followed by Safavid architecture; Safavid architecture is followed by Afsharid architecture; Afsharid architecture is followed by Zand architecture; and Qajar architecture follows Zand architecture and is followed by Pahlavi architecture. The arrows below run from earlier to later, and each label identifies the item carrying the recorded statement:

```mermaid
flowchart LR
    ilkhanid["Ilkhanid architecture (Q98399895)"] -->|P155 on Timurid| timurid["Timurid architecture (Q16047695)"]
    timurid -->|P156 on Timurid; P155 on Safavid| safavid["Safavid architecture (Q5957125)"]
    safavid -->|P156 on Safavid; P155 on Afsharid| afsharid["Afsharid architecture (Q98399175)"]
    afsharid -->|P156 on Afsharid; P155 on Zand| zand["Zand architecture (Q5679012)"]
    zand -->|P156 on Zand; P155 on Qajar| qajar["Qajar architecture (Q5718239)"]
    qajar -->|P156 on Qajar| pahlavi["Pahlavi architecture (Q17993891)"]
```

These are chronology/sequence links, not `subclass of` relationships, and they do not prove a complete or uncontested history of architectural influence. Architectural traditions can overlap, continue across political periods, and vary by region. The links should therefore be treated as claims to investigate, not as a definitive linear typology. In the revision checked on 25 November 2026, the listed P155/P156 statements had no attached references; their historical interpretation should be verified against reliable scholarship before reuse. An absent reciprocal statement should not be silently filled in.

For the local ontology, `mdhn:SubjectTerm` could provide a place to link reviewed style concepts, but the reviewed ontology does not define a dedicated architectural-style class or a property for assigning a style to a building. If the project needs to distinguish styles from general subjects, it should make that distinction explicit in its local model rather than infer it from labels or copy Wikidata's P31/P279 pattern without checking its intended semantics.

### 7.2 Domain and range: Wikidata's property constraints

In RDF Schema or OWL, domain and range axioms are formal schema statements with entailment effects: they infer types for a statement's subject or value rather than reject the triple. Wikidata's closest practical equivalents are **subject type constraints** and **value-type constraints**, represented as constraints on a property using P2302. Wikidata documentation calls these the domain and range, respectively. They are editorial guidance and validation signals, not hard restrictions that prevent a statement from being added.

The property's datatype controls the kind of value it can hold at a basic level. For example, P149 (architectural style) has the `WikibaseItem` datatype: its value must be an item, but that datatype alone does not ensure the item is actually an architectural style. Type constraints provide a more semantic check:

| Wikidata property | Subject-type constraint (domain-like) | Value-type constraint (range-like) |
|---|---|---|
| [Architectural style (P149)](https://www.wikidata.org/wiki/Property:P149) | As observed 25 November 2026: includes built structures and architectural elements, among other allowed subject classes | As observed 25 November 2026: includes architectural style, architectural typology, art style, and type of architectural structure |

The current P149 constraints therefore support using style items such as Q5957125 as values for suitable built-structure subjects. A constraint checker can follow P279 paths when assessing whether a subject or value fits a class. A reported violation is still not proof of an error: the constraint may be broad, a class path may be missing, or the statement may be a valid exception.

Do not confuse domain/range-like constraints with a **property scope constraint**, which indicates whether a property is intended for a statement's main value, a qualifier, or a reference. For this project, use these constraints to flag records for review, then apply stricter local validation (for example, SHACL) if the local graph requires enforced domain/range rules.

## 8. Recommendations for improving data quality

### Before importing Wikidata data

1. **Define the scope.** Maintain a list of the relevant item IDs and the claims the project actually needs; do not harvest broad categories without review.
2. **Verify identity.** Confirm each item's labels, aliases, descriptions, location, dates, and references against authoritative records or scholarly sources relevant to that monument.
3. **Review statements individually.** Check the value, qualifiers, rank, references, and history of important claims. Flag missing or weak references for review rather than silently accepting them.
4. **Validate authority mappings.** Open each AAT/LCSH or other external record and compare scope. Record the mapping type and confidence; use a non-exact relationship or defer mapping if uncertain.
5. **Keep local provenance.** Record the QID, source property/value, retrieval date, source URL or reference, and local review status. Keep imported values distinguishable from locally asserted facts.

### When a possible error is found

1. Record the item, property, current value, qualifier, rank, reference, and revision history.
2. Find a reliable source that directly supports the proposed correction; distinguish a factual error from an incomplete or differently scoped classification.
3. Check property constraints and related items for context, treating constraint reports as prompts rather than verdicts.
4. If the evidence is clear, make a narrowly scoped Wikidata edit with a suitable reference and an informative edit summary. If the scope is disputed or the change affects a shared hierarchy, discuss it with relevant Wikidata contributors before changing it.
5. Re-run the scoped quality checks and document the outcome locally. If no adequate source is available, leave the claim unchanged and mark it for follow-up.

### Project-level priorities

| Priority | Action | Result |
|---|---|---|
| High | Create a reviewed seed list of monuments and subject concepts, each with a stable QID (where available), preferred Persian/English labels, and evidence for the match. | Reduces mistaken identity and uncontrolled scope. |
| High | Add a local mapping/provenance pattern for QIDs and external authority identifiers; distinguish proposed, reviewed, exact, and broader/narrower mappings. | Makes integration auditable without implying unverified equivalence. |
| High | Define a small validation checklist for `P31`, `P279`, `P361`, `P527`, coordinates, heritage claims, and references. | Catches structural and claim-level problems before use. |
| Medium | Measure Persian label/description and reference coverage over the reviewed seed list. | Replaces general claims about coverage with repeatable results. |
| Medium | Add bounded, monitored SPARQL checks and record retrieval time; plan for the WDQS backend migration. | Makes harvesting reproducible and resilient to service changes. |
| Medium | Review Commons image rights, availability, and IIIF suitability independently from Wikidata's P18 values. | Avoids treating a media link as a ready-to-use IIIF resource. |

## 9. Case studies: richly described instances

For these case studies, “richest” means coverage of useful architectural fields, with referenced claims preferred when candidate items have similar coverage. The candidate search was scoped to items whose country (P17) is Iran (Q794) and whose direct `instance of` (P31) class is the target class or a subclass of it (`P31/P279*`). The broad class path timed out for architectural ensembles, so that category was checked against direct P31 instances instead. The coverage score below gives one point for each of 11 fields present: location (P131), coordinates (P625), inception (P571), architect (P84), architectural style (P149), material (P186), heritage designation (P1435), image (P18), AAT ID (P1014), LCSH ID (P244), and Commons category (P373). Multiple values in one field still count once. P31 and P17 are also harvested but are not part of this score.

The selected examples are candidates, not a definitive “top” list: Wikidata changes, some claims have weak or missing references, and large class paths may time out on WDQS. The query below retrieves the direct item claims and their references for the chosen examples as normalized property/value rows. Its fixed class/item list avoids repeating the broad class-path search during harvesting. A site may appear under more than one class because the Wikidata hierarchy is not mutually exclusive.

**SPARQL harvest query for the case-study sample:**

```sparql
SELECT DISTINCT ?class ?item ?itemLabel ?property ?propertyLabel
                ?value ?valueLabel ?reference WHERE {
  VALUES (?class ?item) {
    (wd:Q32815 wd:Q856356)
    (wd:Q32815 wd:Q643098)
    (wd:Q186347 wd:Q6394061)
    (wd:Q186347 wd:Q6558875)
    (wd:Q162875 wd:Q5952145)
    (wd:Q162875 wd:Q5860687)
    (wd:Q4989906 wd:Q5952145)
    (wd:Q4989906 wd:Q5860687)
    (wd:Q1497375 wd:Q4993148)
    (wd:Q1497375 wd:Q4243)
  }

  {
    { ?item p:P31 ?statement. ?statement ps:P31 ?value. BIND(wd:P31 AS ?property) }
    UNION { ?item p:P17 ?statement. ?statement ps:P17 ?value. BIND(wd:P17 AS ?property) }
    UNION { ?item p:P131 ?statement. ?statement ps:P131 ?value. BIND(wd:P131 AS ?property) }
    UNION { ?item p:P625 ?statement. ?statement ps:P625 ?value. BIND(wd:P625 AS ?property) }
    UNION { ?item p:P571 ?statement. ?statement ps:P571 ?value. BIND(wd:P571 AS ?property) }
    UNION { ?item p:P84 ?statement. ?statement ps:P84 ?value. BIND(wd:P84 AS ?property) }
    UNION { ?item p:P149 ?statement. ?statement ps:P149 ?value. BIND(wd:P149 AS ?property) }
    UNION { ?item p:P186 ?statement. ?statement ps:P186 ?value. BIND(wd:P186 AS ?property) }
    UNION { ?item p:P1435 ?statement. ?statement ps:P1435 ?value. BIND(wd:P1435 AS ?property) }
    UNION { ?item p:P18 ?statement. ?statement ps:P18 ?value. BIND(wd:P18 AS ?property) }
    UNION { ?item p:P1014 ?statement. ?statement ps:P1014 ?value. BIND(wd:P1014 AS ?property) }
    UNION { ?item p:P244 ?statement. ?statement ps:P244 ?value. BIND(wd:P244 AS ?property) }
    UNION { ?item p:P373 ?statement. ?statement ps:P373 ?value. BIND(wd:P373 AS ?property) }
  }
  OPTIONAL { ?statement prov:wasDerivedFrom ?reference. }
  SERVICE wikibase:label { bd:serviceParam wikibase:language "en,fa". }
}
ORDER BY ?classLabel ?itemLabel ?propertyLabel ?valueLabel
```

Each result row represents one selected property/value statement; `?reference` is absent where the statement has no reference. `?value` preserves the actual value, while `?valueLabel` makes item-valued claims readable. This shape keeps multi-valued fields and statement-level provenance visible instead of flattening them into one unqualified label.

| Class | Case-study instances (field coverage; referenced property/value pairs) |
|---|---|
| Mosque | [Sheikh Lotfollah Mosque (Q856356)](https://www.wikidata.org/wiki/Q856356) (10/11; 13); [Shah Mosque (Q643098)](https://www.wikidata.org/wiki/Q643098) (9/11; 12) |
| Caravanserai | [Dayr-e Gachin Caravanserai (Q6394061)](https://www.wikidata.org/wiki/Q6394061) (7/11; 11); [Khajeh Nazar Caravanserai (Q6558875)](https://www.wikidata.org/wiki/Q6558875) (7/11; 8) |
| Mausoleum | [Avicenna Mausoleum (Q5952145)](https://www.wikidata.org/wiki/Q5952145) (9/11; 11); [Imamzadeh Harun-e Velayat (Q5860687)](https://www.wikidata.org/wiki/Q5860687) (9/11; 16) |
| Monument | [Avicenna Mausoleum (Q5952145)](https://www.wikidata.org/wiki/Q5952145) (9/11; 11); [Imamzadeh Harun-e Velayat (Q5860687)](https://www.wikidata.org/wiki/Q5860687) (9/11; 16). Both also reach the broader Monument class through P31/P279 traversal; their property profiles appear under Mausoleum. |
| Architectural ensemble | [Qasr Prison (Q4993148)](https://www.wikidata.org/wiki/Q4993148) (9/11; 10); [Sheikh Safi al-Din Khānegāh and Shrine Ensemble (Q4243)](https://www.wikidata.org/wiki/Q4243) (8/11; 17) |

### Property profiles

The profile lines below spell out each property's P-code and current English label alongside the values recorded for the item. `P186` is currently labelled **made from material**. Coordinates are written as longitude, latitude from WDQS's `Point(longitude latitude)` value. Dates are shown as stored; inspect the statement's time precision before treating the month or day as historically exact. Items reused under Monument are described once because they are the same Wikidata records.

#### Mosques

**[Sheikh Lotfollah Mosque (Q856356)](https://www.wikidata.org/wiki/Q856356)** — 10/11 fields; 13 referenced property/value pairs.

- `P31` (instance of): mosque, cultural property, architectural landmark; `P17` (country): Iran; `P131` (located in the administrative territorial entity): District 3; `P625` (coordinate location): 51.678535, 32.657454.
- `P571` (inception): 1603-01-01; `P84` (architect): Bahāʾ al-dīn al-ʿĀmilī; `P149` (architectural style): Safavid architecture.
- `P186` (made from material): brick, marble, mortar, stone, tile; `P1435` (heritage designation): Iranian National Heritage.
- `P18` (image) and `P373` (Commons category): present; `P244` (Library of Congress Authorities ID): `nr2004011340`. No `P1014` (AAT ID) value was returned.

**[Shah Mosque (Q643098)](https://www.wikidata.org/wiki/Q643098)** — 9/11 fields; 12 referenced property/value pairs.

- `P31` (instance of): mosque, cultural property, architectural landmark; `P17` (country): Iran; `P131` (located in the administrative territorial entity): District 3; `P625` (coordinate location): 51.677777777, 32.654805555.
- `P571` (inception): 1611-04-29; `P84` (architect): Bahāʾ al-dīn al-ʿĀmilī; `P149` (architectural style): Safavid architecture.
- `P186` (made from material): brick, mortar, stone, tile; `P1435` (heritage designation): Iranian National Heritage; `P18` (image) and `P373` (Commons category): present.
- No `P1014` (AAT ID) or `P244` (Library of Congress Authorities ID) value was returned.

#### Caravanserais

**[Dayr-e Gachin Caravanserai (Q6394061)](https://www.wikidata.org/wiki/Q6394061)** — 7/11 fields; 11 referenced property/value pairs.

- `P31` (instance of): caravanserai, cultural property; `P17` (country): Iran; `P131` (located in the administrative territorial entity): Qomrud Rural District; `P625` (coordinate location): 51.420111111, 35.058277777.
- `P149` (architectural style): Sasanian, Seljuk, and Safavid architecture; `P186` (made from material): brick and plaster.
- `P1435` (heritage designation): Iranian National Heritage and “part of UNESCO World Heritage Site”; `P18` (image) and `P373` (Commons category): present.
- No `P571` (inception), `P84` (architect), `P1014` (AAT ID), or `P244` (Library of Congress Authorities ID) value was returned.

**[Khajeh Nazar Caravanserai (Q6558875)](https://www.wikidata.org/wiki/Q6558875)** — 7/11 fields; 8 referenced property/value pairs.

- `P31` (instance of): caravanserai, cultural property; `P17` (country): Iran; `P131` (located in the administrative territorial entity): Jolfa County; `P625` (coordinate location): 45.576944444, 38.9775.
- `P149` (architectural style): Safavid architecture; `P186` (made from material): rubble and mortar. The mortar claim had no reference in the checked revision.
- `P1435` (heritage designation): Iranian National Heritage and “part of UNESCO World Heritage Site”; `P18` (image) and `P373` (Commons category): present.
- No `P571` (inception), `P84` (architect), `P1014` (AAT ID), or `P244` (Library of Congress Authorities ID) value was returned.

#### Mausoleums and monuments

**[Avicenna Mausoleum (Q5952145)](https://www.wikidata.org/wiki/Q5952145)** — 9/11 fields; 11 referenced property/value pairs.

- `P31` (instance of): mausoleum, tower, cultural property; `P17` (country): Iran; `P131` (located in the administrative territorial entity): Hamadan County; `P625` (coordinate location): 48.513166666, 34.791527777.
- `P571` (inception): 1951-01-01; `P84` (architect): Hooshang Seyhoun; `P149` (architectural style): architecture of Iran.
- `P186` (made from material): granite and reinforced concrete; `P1435` (heritage designation): Iranian National Heritage; `P18` (image) and `P373` (Commons category): present.
- No `P1014` (AAT ID) or `P244` (Library of Congress Authorities ID) value was returned.

**[Imamzadeh Harun-e Velayat (Q5860687)](https://www.wikidata.org/wiki/Q5860687)** — 9/11 fields; 16 referenced property/value pairs.

- `P31` (instance of): imamzadeh, madrasa, mausoleum, cultural property; `P17` (country): Iran; `P131` (located in the administrative territorial entity): District 3; `P625` (coordinate location): 51.682611111, 32.665777777.
- `P571` (inception): 1512-01-01 (unreferenced in the checked revision); `P84` (architect): Mirza Shah Hossein; `P149` (architectural style): Islamic, Qajar, and Safavid architecture.
- `P186` (made from material): adobe, brick, plaster, stone, tile; `P1435` (heritage designation): Iranian National Heritage; `P18` (image) and `P373` (Commons category): present.
- No `P1014` (AAT ID) or `P244` (Library of Congress Authorities ID) value was returned.

Both mausoleums also appear in the Monument case through the broader `P31`/`P279` class path. This does not add a direct Monument `P31` claim to either building, and their multiple direct `P31` values do not make those types subclasses of one another.

#### Architectural ensembles

**[Qasr Prison (Q4993148)](https://www.wikidata.org/wiki/Q4993148)** — 9/11 fields; 10 referenced property/value pairs.

- `P31` (instance of): architectural ensemble, prison; `P17` (country): Iran; `P131` (located in the administrative territorial entity): District 7; `P625` (coordinate location): 51.448333333, 35.723472222.
- `P84` (architect): Nikolai Markov; `P149` (architectural style): Pahlavi architecture; `P186` (made from material): brick and mortar.
- `P1435` (heritage designation): Iranian National Heritage; `P18` (image) and `P373` (Commons category): present; `P244` (Library of Congress Authorities ID): `no2010159471`.
- No `P571` (inception) or `P1014` (AAT ID) value was returned.

**[Sheikh Safi al-Din Khānegāh and Shrine Ensemble (Q4243)](https://www.wikidata.org/wiki/Q4243)** — 8/11 fields; 17 referenced property/value pairs.

- `P31` (instance of): Sufi lodge, architectural ensemble, cultural property, imamzadeh, mausoleum; `P17` (country): Iran; `P131` (located in the administrative territorial entity): Ardabil County; `P625` (coordinate location): 48.291388888, 38.248611111.
- `P571` (inception): 1334-01-01 (unreferenced in the checked revision); `P149` (architectural style): Ilkhanid, Timurid, and Safavid architecture.
- `P186` (made from material): brick, plaster, silver, stone, tile. The silver claim had no reference in the checked revision.
- `P1435` (heritage designation): Iranian National Heritage and World Heritage Site; `P18` (image) and `P373` (Commons category): present.
- No `P84` (architect), `P1014` (AAT ID), or `P244` (Library of Congress Authorities ID) value was returned.

Coverage and reference-pair counts are dataset measures, not judgments of historical importance or source quality. The case-study values above were checked on 26 November 2026; verify each statement's references and qualifiers before reuse. The overlap between the Mausoleum and Monument examples is expected: a site can be an instance of a specific class while that class is also a subclass of a broader one.

## 10. OpenStreetMap, Taginfo, and spatial coordination

OpenStreetMap (OSM) and Wikidata can complement one another, but they describe different aspects of a heritage resource. Wikidata can provide an identified item, multilingual labels, structured claims, and a point coordinate through `coordinate location` (P625). OSM can provide the mapped geographic feature and its geometry. A point in Wikidata should not be treated as a replacement for an OSM building footprint or for a relation describing a larger complex.

OSM represents features with **nodes**, **ways**, and **relations**. Nodes have WGS 84 latitude/longitude coordinates; ways are ordered node sequences that can represent lines or area boundaries; and relations group elements for structures such as multipolygons. A complex may therefore be one relation with several ways and member features rather than one point. When storing an OSM link locally, retain both the element type and its ID (`node`, `way`, or `relation`), along with the retrieved geometry and retrieval date.

The OSM `wikidata=*` tag links an OSM element to the Wikidata QID that is about that feature. It can be used on nodes, ways, areas, and relations. The tag should identify the mapped feature itself; for example, an operator or brand should use its role-specific Wikidata tag rather than placing the operator's QID in the feature's `wikidata=*` tag. OSM guidance says that one Wikidata ID will usually correspond to one OSM element, while recognizing valid exceptions. This matters for architectural ensembles and multi-part monuments: check whether a QID refers to the whole complex, a constituent building, or both before treating repeated links as duplicates.

**Taginfo has a different role.** It summarizes tag usage in OSM: which keys and values are present, how frequently they occur, what tags commonly accompany them, and where tags are distributed. Its global site is updated daily and its API provides statistics and related tag data. For this project, Taginfo can help discover and compare OSM tagging practices for building types and heritage attributes, including whether and how `wikidata=*` is used. It is not a substitute for querying an individual OSM feature's geometry, and tag frequency or a documented convention does not prove that a particular site's tag is correct.

```mermaid
flowchart LR
    taginfo["Taginfo<br/>Tag usage, combinations, distributions"] -->|tagging context| review["Reviewed crosswalk"]
    osm["OpenStreetMap<br/>Node / way / relation<br/>Tags and geometry"] -->|spatial feature| review
    wikidata["Wikidata<br/>QID, claims, P625 point"] -->|identity and attributes| review
    review --> local["Local record<br/>Keep source and geometry provenance"]
```

For spatial reconciliation, prefer an explicit OSM `wikidata=Q...` match when the tag clearly identifies the same feature. Otherwise, use P625 as a candidate point and compare it with OSM geometry, names, local administrative context, and feature tags; proximity alone is not enough to establish identity. A Wikidata point may represent a site marker or approximate location, while OSM may map the building outline or an entire compound. Preserve the two sources separately, record the matching method and confidence, and manually review ambiguous cases rather than moving or overwriting coordinates automatically.

For example, `wikidata=Q856356` can be used as a search criterion for a possible OSM representation of Sheikh Lotfollah Mosque. Confirm that the matching node, way, or relation actually represents that mosque before importing its geometry.

Taginfo's API is read-only and resource-limited: use it for bounded statistics requests with a descriptive User-Agent, and use OSM data services or suitable extracts when the task requires feature-level geometries. OSM data and Taginfo data are available under the Open Database License (ODbL); check attribution and license obligations before redistribution or combining them into a derived database.

## 11. Example SPARQL quality checks

These queries are starting points for a **scoped review**, not automatic correction rules. Adapt the endpoint and syntax to the active WDQS version. A missing reference is a prompt for investigation; it is not, by itself, proof that a statement is false.

**Find active, direct class statements without a reference on a small seed set:**

```sparql
SELECT ?item ?itemLabel ?parent ?parentLabel WHERE {
  VALUES ?item { wd:Q32815 wd:Q186347 wd:Q162875 wd:Q636232 wd:Q1356021 }
  ?item p:P279 ?statement .
  ?statement ps:P279 ?parent ;
             wikibase:rank ?rank .
  FILTER(?rank != wikibase:DeprecatedRank)
  FILTER NOT EXISTS { ?statement prov:wasDerivedFrom ?reference }
  SERVICE wikibase:label { bd:serviceParam wikibase:language "en,fa". }
}
```

**Find items in the reviewed seed set with no Persian label:**

```sparql
SELECT ?item WHERE {
  VALUES ?item { wd:Q32815 wd:Q186347 wd:Q162875 wd:Q636232 wd:Q1356021 }
  FILTER NOT EXISTS {
    ?item rdfs:label ?label .
    FILTER(LANG(?label) = "fa")
  }
}
```

For a future harvesting pipeline, query only the required fields, set reasonable timeouts and retry limits, log endpoint errors, and validate returned identifiers and datatypes before loading them into the local graph.

## 12. Fetching Wikidata data: JSON and Turtle

Wikidata's EntityData endpoint can return an item's data in more than one serialization. A format can be selected in the URL or negotiated with the HTTP `Accept` header:

| Representation | Example URL | MIME type |
|---|---|---|
| JSON | `https://www.wikidata.org/wiki/Special:EntityData/Q4243.json` | `application/json` |
| Turtle | `https://www.wikidata.org/wiki/Special:EntityData/Q4243.ttl` | `text/turtle` |

For an extensionless EntityData URL, request `Accept: application/json` or `Accept: text/turtle` to negotiate the representation. The endpoint returned these formats and MIME types when checked on 25 November 2026. JSON is convenient for consuming Wikibase labels, descriptions, claims, qualifiers, and references through code. Turtle (`.ttl`) serializes the data as RDF triples and is convenient for loading into RDF tools and graph stores. They are different representations, so choose based on the receiving system rather than assuming a field-for-field JSON-to-Turtle conversion.

The Wikibase API can also return multiple items in JSON in one request, for example:

```text
https://www.wikidata.org/w/api.php?action=wbgetentities&ids=Q4243%7CQ5939601%7CQ20645774&props=labels%7Cdescriptions%7Cclaims&languages=en%7Cfa&format=json
```

Here `.ttl` means the Turtle RDF format, not a cache time-to-live. Caching is a separate concern: respect HTTP cache headers, record retrieval dates and item revisions where practical, and handle timeouts or partial responses explicitly because Wikidata statements can change.

## 13. Conclusion

Wikidata is a promising complementary authority for Persian architecture, especially for entity identifiers, multilingual discovery, material statements, and links to external vocabularies. OSM can complement it with feature geometries, while Taginfo can help assess how OSM tags are actually used. Their usefulness depends on item-by-item identity checks, careful treatment of class hierarchies and style chronology, and transparent provenance. The observed examples illustrate why “queryable” should not be equated with “reliable without review.”

The next stage should extend the seed list with the additional subject concepts identified for this project, then evaluate coverage and quality against the same documented criteria. Until that work is complete, this report should be read as a preliminary assessment rather than a comprehensive census or a claim that specific Wikidata statements are wrong.

## References and review basis

- [Wikidata: Help:Sources](https://www.wikidata.org/wiki/Help:Sources)
- [Wikidata: Verifiability](https://www.wikidata.org/wiki/Wikidata:Verifiability) — page marked as a proposed policy or guideline at review time
- [Wikidata: Help:Property constraints](https://www.wikidata.org/wiki/Help:Property_constraints)
- [Wikidata: Subject type constraint (domain)](https://www.wikidata.org/wiki/Help:Property_constraints_portal/Subject_class)
- [Wikidata: Value-type constraint (range)](https://www.wikidata.org/wiki/Help:Property_constraints_portal/Value_class)
- [Wikidata: Instance of (P31)](https://www.wikidata.org/wiki/Property:P31)
- [Wikidata: Subclass of (P279)](https://www.wikidata.org/wiki/Property:P279)
- [Wikidata: Country (P17)](https://www.wikidata.org/wiki/Property:P17)
- [Wikidata: Located in the administrative territorial entity (P131)](https://www.wikidata.org/wiki/Property:P131)
- [Wikidata: Coordinate location (P625)](https://www.wikidata.org/wiki/Property:P625)
- [Wikidata: Inception (P571)](https://www.wikidata.org/wiki/Property:P571)
- [Wikidata: Architect (P84)](https://www.wikidata.org/wiki/Property:P84)
- [Wikidata: Architectural style (P149)](https://www.wikidata.org/wiki/Property:P149)
- [Wikidata: Made from material (P186)](https://www.wikidata.org/wiki/Property:P186)
- [Wikidata: Heritage designation (P1435)](https://www.wikidata.org/wiki/Property:P1435)
- [Wikidata: Image (P18)](https://www.wikidata.org/wiki/Property:P18)
- [Wikidata: AAT ID (P1014)](https://www.wikidata.org/wiki/Property:P1014)
- [Wikidata: Library of Congress Authorities ID (P244)](https://www.wikidata.org/wiki/Property:P244)
- [Wikidata: Commons category (P373)](https://www.wikidata.org/wiki/Property:P373)
- [Wikidata: Follows (P155)](https://www.wikidata.org/wiki/Property:P155)
- [Wikidata: Followed by (P156)](https://www.wikidata.org/wiki/Property:P156)
- [Wikidata: SPARQL query service](https://www.wikidata.org/wiki/Wikidata:SPARQL_query_service)
- [Wikidata Query Service backend migration](https://www.wikidata.org/wiki/Wikidata:SPARQL_query_service/WDQS_backend_update)
- [Wikibase API: wbgetentities](https://www.wikidata.org/w/api.php?action=help&modules=wbgetentities)
- [Wikidata data access](https://www.wikidata.org/wiki/Wikidata:Data_access)
- [OpenStreetMap Wiki: Elements](https://wiki.openstreetmap.org/wiki/Elements)
- [OpenStreetMap Wiki: `wikidata` key](https://wiki.openstreetmap.org/wiki/Key:wikidata)
- [Taginfo: About](https://taginfo.openstreetmap.org/about)
- [Taginfo API documentation](https://taginfo.openstreetmap.org/taginfo/apidoc)
- [OpenStreetMap copyright and ODbL](https://www.openstreetmap.org/copyright)
- [Persian Architecture project README](../README.md)
- [Persian Architecture Ontology](../data/turtles/Persian%20Architecture%20Ontology.ttl)

The sample labels, external identifiers, direct class and material statements, style-sequence links, and serialization behavior were checked against Wikidata on 25 November 2026; case-study property values and reference presence were refreshed on 26 November 2026. OSM and Taginfo descriptions were checked against their documentation on 26 November 2026. The review was limited to the listed sample items and does not establish completeness or certify every statement on those items.
