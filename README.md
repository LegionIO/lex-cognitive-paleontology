# lex-cognitive-paleontology

Fossil record for extinct cognitive patterns in LegionIO agents. When strategies, beliefs, or heuristics are abandoned they can be fossilized and stratified by age. Excavation rediscovers them; preservation degrades over time unless reinforced.

## What It Does

- Eight fossil types: strategy, pattern, belief, heuristic, association, routine, assumption, framework
- Five strata depths (0–4) mapped to era names (present-day to archaic)
- Preservation degrades per cycle (FOSSILIZATION_RATE = 0.02); reinforce to maintain
- Five preservation states: pristine, good, fair, poor, degraded
- Excavations target a specific stratum and discover all fossils there
- Keystone fossils (high significance) and ancient fossils (deep stratum) identified
- Lineage linking connects related fossil chains

## Usage

```ruby
# Fossilize an extinct pattern
runner.record_extinction(
  content: 'monolithic deployment strategy',
  fossil_type: :strategy,
  extinction_cause: :superseded,
  stratum_depth: 1,
  significance: 0.7
)

# Begin excavation
excav = runner.begin_excavation(target_stratum: 1)
excav_id = excav[:excavation][:id]

# Excavate — discover fossils at that depth
runner.excavate(excavation_id: excav_id)
# => { success: true, discovered: 1, fossils: [{ content: 'monolithic...', preservation: 0.98, ... }] }

# Complete excavation
runner.complete_excavation(excavation_id: excav_id)

# Status
runner.paleontology_status
# => { success: true, total_fossils: 1, by_type: { strategy: 1 }, avg_preservation: 0.98, ... }
```

## Development

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

## License

MIT
