//
//  ContentView.swift
//  topBarMenuWith3Pages
//
//  Created by Aadish Jain on 14/05/25.
//

import SwiftUI

// MARK: - Enum for Tabs
enum TopTab: String, CaseIterable {
    case tasksToday = "Today"
    case upcomingTasks = "Upcoming"
    case completedTasks = "Completed"
}

// MARK: - Main ContentView
struct ContentView: View {
    @State private var selectedTab: TopTab = .tasksToday
    @Namespace private var animation

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(TopTab.allCases, id: \.self) { tab in
                    Button(action: {
                        withAnimation(.spring()) {
                            selectedTab = tab
                        }
                    }) {
                        VStack {
                            Text(tab.rawValue)
                                .fontWeight(.semibold)
                                .foregroundColor(selectedTab == tab ? .blue : .gray)
                                .padding(.vertical, 10)

                            
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.horizontal)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 0))

            TabView(selection: $selectedTab) {
                TodayTasksView()
                    .tag(TopTab.tasksToday)

                UpcomingTasksView()
                    .tag(TopTab.upcomingTasks)

                CompletedTasksView()
                    .tag(TopTab.completedTasks)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .ignoresSafeArea(.keyboard)
    }
}

// MARK: - Placeholder Pages
struct TodayTasksView: View {
    var body: some View {
        VStack {
            Text("Today's Tasks Page")
                .font(.title)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

struct UpcomingTasksView: View {
    var body: some View {
        VStack {
            Text("Upcoming Tasks Page")
                .font(.title)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

struct CompletedTasksView: View {
    var body: some View {
        VStack {
            Text("Completed Tasks Page")
                .font(.title)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
