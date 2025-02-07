//
//  ContentView.swift
//  CustomCalendar
//
//  Created by Antoine Lucchini on 07/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScheduleView { date in
            print("Date selected: \(date)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
