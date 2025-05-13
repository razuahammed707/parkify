What I’ve Done:

I worked on the Home screen module of the Parkify iOS app. My responsibilities included:

- Designing the main Home screen layout
- Creating a toggle between List View and Map View
- Building the UI for both card-based (horizontal) and row-based (vertical) parking displays
- Implementing a custom search bar.
- Developing an interactive Map View with tappable annotations
- Adding a dynamic bottom sheet that shows parking spot details and a "Book Parking" button
- Structuring everything using `HomeViewModel` for state management

---

Files I Created or Updated:

Views/Home:

- `HomeView.swift` – Main container that links all components together and presents the detail sheet
- `SearchBarView.swift` – Search bar UI with binding support
- `ParkingCardView.swift` – Card for horizontal scroll of nearby spots
- `ParkingRowView.swift` – Row for vertical list view of nearby spots
- `ViewToggleView.swift` – Toggle button to switch between list and map
- `ParkingDetailView.swift` – Bottom sheet with spot image, name, info, and "Book Now" button
- `MapView.swift` – Updated with `onSpotTap` so map pins can trigger the detail view

ViewModels:

- `HomeViewModel.swift` – Manages view toggle, search filtering, and selected spot for sheet

Models:

- `ParkingSpot.swift` – Added computed properties:
    - `coordinate` for map
    - `imageName` for dummy image binding
    - `distance` for UI testing
Account Setting
    - Update user setting
    - Update and add payment method
