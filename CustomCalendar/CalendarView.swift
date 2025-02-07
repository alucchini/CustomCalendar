//
//  CalendarView.swift
//  CustomCalendar
//
//  Created by Antoine Lucchini on 07/02/2025.
//

import SwiftUI

struct CalendarView: View {
    @State private var currentMonth = Date.now
    @State private var selectedDate = Date.now
    @State private var selectedHour = Date.now
    @State private var days: [Date] = []

    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)

    var onDateSelected: (Date, Date) -> Void

    var body: some View {
        VStack(spacing: 20) {
            // Navigation entre les mois
            HStack {
                Text(currentMonth.formatted(.dateTime.year().month()))
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                Spacer()
                Button {
                    currentMonth = Calendar.current.date(byAdding: .month, value: -1, to: currentMonth)!
                    updateDays()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundStyle(.blue)
                }
                Button {
                    currentMonth = Calendar.current.date(byAdding: .month, value: 1, to: currentMonth)!
                    updateDays()
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .foregroundStyle(.blue)
                }
            }

            // Affichage des jours de la semaine
            HStack {
                ForEach(daysOfWeek.indices, id: \.self) { index in
                    Text(daysOfWeek[index])
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                }
            }

            // Grille des jours
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(days, id: \.self) { day in
                    Button {
                        if day >= Date.now.startOfDay && day.monthInt == currentMonth.monthInt {
                            selectedDate = day
                            onDateSelected(selectedDate, selectedHour)
                        }
                    } label: {
                        Text(day.formatted(.dateTime.day()))
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(foregroundStyle(for: day))
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(
                                Circle()
                                    .foregroundStyle(
                                        day.formattedDate == selectedDate.formattedDate
                                            ? .blue
                                            : .clear
                                    )
                            )
                    }
                    .disabled(day < Date.now.startOfDay || day.monthInt != currentMonth.monthInt)
                }
            }
            DatePicker(
                "",
                selection: $selectedHour,
                displayedComponents: [.hourAndMinute]
            )
            .onChange(of: selectedHour) {
                onDateSelected(selectedDate, selectedHour)
            }
            .datePickerStyle(.compact)
            .datePickerStyle(GraphicalDatePickerStyle())
            .colorMultiply(.white)
            .environment(\.colorScheme, .dark)
        }
        .padding()
        .onAppear {
            updateDays()
            onDateSelected(selectedDate, selectedHour)
        }
    }

    private func updateDays() {
        days = currentMonth.calendarDisplayDays
    }

    private func foregroundStyle(for day: Date) -> Color {
        let isDifferentMonth = day.monthInt != currentMonth.monthInt
        let isSelectedDate = day.formattedDate == selectedDate.formattedDate
        let isPastDate = day < Date.now.startOfDay

        if isDifferentMonth {
            return isSelectedDate ? .black : .white.opacity(0.3)
        } else if isPastDate {
            return .white.opacity(0.3)
        } else {
            return isSelectedDate ? .black : .white
        }
    }
}
