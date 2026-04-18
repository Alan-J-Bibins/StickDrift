# Stick Drift - Figma Alternative for the Sane with 3D design capabilities

## The Idea

An offline-first, native, gpu-accelerated design program that is oriented mainly for UI development with support for designing 3D experiences as well 
as regular 2D content.

## Why emphasize on 3D?

Recently I had the pleasure of designing and implementing a threejs landing page for one of my university's events. In doing so I realized how sorely 
lacking this space is in terms of proper design tools, the workflow that we followed involved mockups / wireframes created in figma with large spaces 
left where the 3D content would be placed. This was a clear gap which quickly frustrated me and many others on my team. We have the tools for UI design, 
we have the tools for 3D modelling and design too, then why not have a platform where the two can be unified?

## Current Requirements

- Cross platform native application
- Support most of the operations that come out of the box with tools like Figma
- Offline-first workflow, be able to save design files locally
- Design tokens / variable support
- 3D Design tools fit atleast for threejs development
- Support for local fonts as well as any online font sources (Google fonts, etc)
- Should be lightweight and snappy
- Image to SVG conversion builtin

## Additional features (Good to have)

- Compatibility with Figma Plugins
- Collaborative features such as Teams, live editing one design file, etc
- Colorscheme / Font styles generation based on given scheme / template (tailwindcss / etc)

## Development timeline

### Phase 1: Get the basic thing working (Workspace + 2D UI Design essentials)
- [ ] Design file schema
- [ ] Welcome Screen
- [ ] Create Design File
- [ ] Setup Workspace (Singular Page for now)
    - [ ] Essential Tools
        - [ ] Select Tool
        - [ ] Move Tool
        - [ ] Scale Tool
        - [ ] Frame Tool


