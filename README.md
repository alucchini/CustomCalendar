# CustomCalendar

A fully customizable SwiftUI calendar component that offers complete control over month navigation, date selection, and time picking. 

---

## Overview

**CustomCalendar** is designed to help you build a SwiftUI-based calendar that goes beyond the limitations of the native `DatePicker`. By structuring the calendar around your specific UX/UI needs, you can:

- Navigate through months effortlessly.  
- Disable or dim past and out-of-range dates.  
- Integrate a time picker for hour and minute selection.  
- Seamlessly combine the selected date and time for parent-level handling.

---

## Features

- **Month Navigation**  
  Move forward or backward through months using intuitive controls.  

- **Day Selection**  
  Present a grid of days for each month; visually distinguish between the current month and adjacent months’ leftover days to fill the calendar view.  

- **Time Picker Integration**  
  Allow users to pick an hour and minute for a more precise selection, ideal for scheduling apps.  

- **Data Flow**  
  Once a date and time are selected, the final merged `Date` is passed up to the parent so you can use it however you wish (e.g., saving to a database, scheduling appointments, etc.).  

---

## Requirements

- **Swift 5.7 or later**  
- **Xcode 14 or later** (for the SwiftUI previews and a smoother development experience)  
- **iOS 15 or later** (tweak the deployment target if necessary)  

---

## Installation

1. **Clone or download** the repository.  
2. **Open** the project in Xcode.  
3. **Build and run** on your simulator or test device.  

No external dependencies are needed—everything runs on SwiftUI and the Foundation framework.

---

## Usage

After opening the project, you’ll see several Swift files. Here’s what each one does:

1. **`ContentView.swift`**  
   Acts as the main entry point. It embeds a `ScheduleView` and handles the final date selection through a simple closure.  

2. **`ScheduleView.swift`**  
   Hosts states for the chosen date and hour. When users confirm their choice, it merges both into a single `Date` and returns that to the parent via a completion handler.  

3. **`CalendarView.swift`**  
   Manages the core calendar logic:  
   - Displays weekdays.  
   - Shows days in a grid, including those from previous/next months (dimmed or disabled).  
   - Handles month transitions (forward/backward).  
   - Integrates a time picker so users can pick hours and minutes directly below the calendar.  

4. **`ExtDate.swift`**  
   Provides a set of date-related extensions to simplify:  
   - Calculating the first and last day of a month.  
   - Building a collection of all days needed to fill the calendar grid.  
   - Formatting dates into strings with or without time components.  

---

## How It Works

1. **Open the App**  
   The app loads `ContentView`, which in turn presents `ScheduleView`.  

2. **View the Calendar**  
   In `CalendarView`, users can:  
   - Navigate through months with next/previous buttons.  
   - See the days aligned to weekdays, including any leading or trailing dates from adjacent months for a clean UI.  

3. **Pick a Date and Hour**  
   Tapping on a valid date sets the selected day. A time picker below the calendar lets users specify hours and minutes.  

4. **Confirm**  
   Once the user presses the confirm button in `ScheduleView`, the chosen date and time are merged into a single `Date` and passed back.  

---

## License

This project is distributed under the [MIT License](LICENSE). Feel free to use, modify, and distribute it to fit your needs.
