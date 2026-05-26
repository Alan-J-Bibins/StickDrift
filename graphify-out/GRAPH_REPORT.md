# Graph Report - StickDrift  (2026-05-27)

## Corpus Check
- 17 files · ~2,360 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 79 nodes · 94 edges · 11 communities (10 shown, 1 thin omitted)
- Extraction: 95% EXTRACTED · 5% INFERRED · 0% AMBIGUOUS · INFERRED: 5 edges (avg confidence: 0.8)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `b45be5e0`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- [[_COMMUNITY_Community 0|Community 0]]
- [[_COMMUNITY_Community 2|Community 2]]
- [[_COMMUNITY_Community 3|Community 3]]
- [[_COMMUNITY_Community 4|Community 4]]
- [[_COMMUNITY_Community 5|Community 5]]
- [[_COMMUNITY_Community 6|Community 6]]
- [[_COMMUNITY_Community 7|Community 7]]
- [[_COMMUNITY_Community 8|Community 8]]
- [[_COMMUNITY_Community 9|Community 9]]

## God Nodes (most connected - your core abstractions)
1. `ajb.sh script` - 6 edges
2. `Stick Drift - Figma Alternative for the Sane with 3D design capabilities` - 6 edges
3. `default-registry` - 4 edges
4. `markDirty()` - 4 edges
5. `updatePaintNode()` - 4 edges
6. `do_configure()` - 3 edges
7. `do_build()` - 3 edges
8. `setZoom()` - 3 edges
9. `mapToWorld()` - 3 edges
10. `SceneNode()` - 3 edges

## Surprising Connections (you probably didn't know these)
- `SceneGraph()` --calls--> `SceneNode()`  [INFERRED]
  app/SceneGraph.h → app/SceneNode.h
- `wheelEvent()` --calls--> `width()`  [INFERRED]
  app/WorkspaceEngine.cpp → app/SceneNode.cpp
- `updatePaintNode()` --calls--> `width()`  [INFERRED]
  app/WorkspaceEngine.cpp → app/SceneNode.cpp
- `wheelEvent()` --calls--> `height()`  [INFERRED]
  app/WorkspaceEngine.cpp → app/SceneNode.cpp
- `updatePaintNode()` --calls--> `height()`  [INFERRED]
  app/WorkspaceEngine.cpp → app/SceneNode.cpp

## Communities (11 total, 1 thin omitted)

### Community 0 - "Community 0"
Cohesion: 0.19
Nodes (5): height(), width(), syncNodes(), updatePaintNode(), wheelEvent()

### Community 2 - "Community 2"
Cohesion: 0.24
Nodes (4): createRectangle(), mapToWorld(), setPan(), setZoom()

### Community 3 - "Community 3"
Cohesion: 0.25
Nodes (7): Additional features (Good to have), Current Requirements, Development timeline, Phase 1: Get the basic thing working (Workspace + 2D UI Design essentials), Stick Drift - Figma Alternative for the Sane with 3D design capabilities, The Idea, Why emphasize on 3D?

### Community 4 - "Community 4"
Cohesion: 0.43
Nodes (3): SceneGraph(), SceneNode(), type()

### Community 5 - "Community 5"
Cohesion: 0.57
Nodes (6): ajb.sh script, do_build(), do_clean(), do_clean_vcpkg(), do_configure(), do_run()

### Community 6 - "Community 6"
Cohesion: 0.53
Nodes (4): markDirty(), setColor(), setHeight(), setWidth()

### Community 7 - "Community 7"
Cohesion: 0.33
Nodes (5): default-registry, baseline, kind, repository, registries

### Community 8 - "Community 8"
Cohesion: 0.50
Nodes (3): dependencies, name, version

## Knowledge Gaps
- **13 isolated node(s):** `name`, `version`, `dependencies`, `kind`, `baseline` (+8 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **1 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `width()` connect `Community 0` to `Community 6`?**
  _High betweenness centrality (0.021) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `updatePaintNode()` (e.g. with `width()` and `height()`) actually correct?**
  _`updatePaintNode()` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `name`, `version`, `dependencies` to the rest of the system?**
  _13 weakly-connected nodes found - possible documentation gaps or missing edges._