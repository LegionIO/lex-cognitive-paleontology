# lex-cognitive-paleontology

**Level 3 Leaf Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-agentic/CLAUDE.md`

## Purpose

Archaeological and fossil metaphor for extinct cognitive patterns. When a cognitive strategy, belief, heuristic, or routine is abandoned, it can be fossilized for later study. Fossils are stratified by depth (0–4, mapped to geological era names). Preservation degrades over time unless reinforced. Excavation processes target a specific stratum depth and discover fossils there. Keystone fossils (high significance) and ancient fossils (deep stratum) can be identified. Lineage linking connects related fossil chains.

## Gem Info

- **Gem name**: `lex-cognitive-paleontology`
- **Module**: `Legion::Extensions::CognitivePaleontology`
- **Version**: `0.1.0`
- **Ruby**: `>= 3.4`
- **License**: MIT

## File Structure

```
lib/legion/extensions/cognitive_paleontology/
  version.rb
  client.rb
  helpers/
    constants.rb
    fossil.rb
  runners/
    cognitive_paleontology.rb
```

## Key Constants

| Constant | Value | Purpose |
|---|---|---|
| `MAX_FOSSILS` | `500` | Per-engine fossil capacity |
| `MAX_STRATA` | `20` | Maximum stratum depth values allowed |
| `MAX_EXCAVATIONS` | `100` | Excavation record capacity |
| `FOSSILIZATION_RATE` | `0.02` | Per-cycle preservation decay |
| `FOSSIL_TYPES` | `%i[strategy pattern belief heuristic association routine assumption framework]` | Valid fossil categories |
| `EXTINCTION_CAUSES` | symbol array | Documented extinction reasons |
| `ERA_NAMES` | hash (0–4) | Stratum depth → era name mapping |
| `PRESERVATION_STATES` | `%i[pristine good fair poor degraded]` | Five preservation quality levels |
| `PRESERVATION_LABELS` | range hash | Preservation score → state label |
| `SIGNIFICANCE_LABELS` | range hash | Significance score labels |
| `STRATUM_LABELS` | hash | Depth → stratum name |

## Helpers

### `Helpers::Fossil`
Individual fossil record. Has `id`, `content`, `fossil_type`, `extinction_cause`, `stratum_depth`, `preservation` (0.0–1.0), `significance`, `lineage_ids` array, and `discovered_at`.

- `erode!` — reduces preservation by `FOSSILIZATION_RATE`
- `reinforce!` — increases preservation
- `imprint?` — high preservation + high significance (pristine and keystone)
- `keystone?` — significance above a high threshold
- `ancient?` — stratum_depth >= a deep threshold
- `preservation_label` / `significance_label`
- `link_lineage(fossil_id)` — appends to `lineage_ids`

### Engine / Excavation
- Fossils are created via `record_extinction`
- Excavations target a stratum depth and collect all fossils at that depth
- `begin_excavation(target_stratum:)` → excavation record
- `excavate(excavation_id:)` → discovers fossils at target stratum
- `complete_excavation(excavation_id:)` → marks excavation done

## Runners

Module: `Runners::CognitivePaleontology`

| Runner Method | Description |
|---|---|
| `record_extinction(content:, fossil_type:, extinction_cause:, stratum_depth:, significance:)` | Fossilize an extinct cognitive pattern |
| `begin_excavation(target_stratum:)` | Start an excavation at a stratum depth |
| `excavate(excavation_id:)` | Discover fossils at the target stratum |
| `complete_excavation(excavation_id:)` | Complete an excavation |
| `list_fossils(fossil_type:, preservation_state:)` | List fossils with optional filters |
| `paleontology_status` | Aggregate stats |

All runners return `{success: true/false, ...}` hashes.

## Integration Points

- `lex-memory`: fossilization is the endpoint of decay — when a memory trace decays completely, it can be recorded as a fossil rather than deleted
- `lex-coldstart`: the imprint window captures recent fossils from the MEMORY.md as `:firmware` traces; paleontology captures older discontinued patterns
- `lex-dream` contradiction_resolution phase: identifying keystone fossils helps resolve contradictions between current and former beliefs
- `lex-identity`: ancient fossils from deep strata represent prior behavioral patterns — useful for entropy drift baseline comparison

## Development Notes

- `Client` instantiates the engine (memoized as `@default_engine` in runner)
- `stratum_depth` is an integer 0–4 (enforced); `ERA_NAMES` maps these to geological eras (present → archaic)
- `excavate` is a query operation — it does not modify fossils; it returns all fossils matching `stratum_depth == target_stratum`
- `FOSSILIZATION_RATE = 0.02` means a perfectly preserved fossil (1.0) degrades to 0 in ~50 cycles without reinforcement
- `imprint?` requires both high preservation AND high significance — it's the rarest classification
