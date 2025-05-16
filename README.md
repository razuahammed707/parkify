
Github Link : https://github.com/razuahammed707/parkify.git


## 👨‍💻 Team Contributions

**Md Razu Ahammed Molla (24699441)** by led the initial phase of the project. His contributions include:

-  Project scaffolding and environment setup
- Creation of initial module and folder structure
- Supabase service integration
- Implementation of global app state
- Setup of RootView as the app's base layout
- Development of the main tab navigation system
- Laying the groundwork for a scalable architecture
- Implemented Booking List
- Implemented the Booking Details View
- Integrated all team members’ code into the main repository

---

Deep Patel

I worked on the Home screen module of the Parkify iOS app. My responsibilities included:

- Designing the main Home screen layout
- Creating a toggle between List View and Map View
- Building the UI for both card-based (horizontal) and row-based (vertical) parking displays
- Implementing a custom search bar.
- Developing an interactive Map View with tappable annotations
- Adding a dynamic bottom sheet that shows parking spot details and a "Book Parking" button
- Structuring everything using `HomeViewModel` for state management

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


----------
Files Created/ Updated by Amrita

The Account folder handles user profile and payment-related screens in the Parkify app. Key views include:

- `AccountView.swift`
  - Main screen for the account section
  - Displays user email
  - Provides navigation to edit profile and payment methods

- `EditProfileView.swift`
  - Allows editing of user profile details (e.g., name, email, birthday, country)
  - Simple and user-friendly form layout

- `AddCardView.swift`
  - UI for adding new payment cards securely
  - Includes field validation and smooth data submission

- `PaymentMethodsView.swift`
  - Shows all stored payment methods
  - Lets users add, update, or delete cards
  - Integrates with `AddCardView` for new entries
 
  ---

  Files Created/ Updated by Aya Issa

  - Splash screen
  - Authentication Screen & Verification
  - Loing screen and all the screens for sign-up.
