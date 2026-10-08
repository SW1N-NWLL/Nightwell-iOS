import SwiftUI
import UIKit

private let discordURL = URL(string: "https://discord.gg/EwXGkGET9Z")!

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem { Label("Главная", systemImage: "house.fill") }
                .tag(0)

            InfoView()
                .tabItem { Label("Информация", systemImage: "info.circle.fill") }
                .tag(1)

            SettingsView()
                .tabItem { Label("Настройки", systemImage: "gearshape.fill") }
                .tag(2)
        }
        .tint(Color(red: 0.66, green: 0.28, blue: 1.0))
        .preferredColorScheme(.dark)
    }
}

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 22) {
                    VStack(spacing: 8) {
                        Text("NWLL")
                            .font(.system(size: 58, weight: .black, design: .rounded))
                            .tracking(5)
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.white, Color(red: 0.70, green: 0.48, blue: 1.0), Color(red: 0.58, green: 0.18, blue: 1.0)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )

                        Text("N I G H T W E L L")
                            .font(.system(size: 13, weight: .bold))
                            .tracking(5)
                            .foregroundStyle(.white.opacity(0.42))
                    }
                    .padding(.top, 28)

                    VStack(alignment: .leading, spacing: 18) {
                        Text("Nightwell")
                            .font(.system(size: 28, weight: .bold))

                        Text("Добро пожаловать в официальное приложение сообщества Nightwell.")
                            .font(.system(size: 18))
                            .foregroundStyle(.white.opacity(0.68))
                            .fixedSize(horizontal: false, vertical: true)

                        Button(action: openDiscord) {
                            Label("Открыть Discord", systemImage: "bubble.left.and.bubble.right.fill")
                                .font(.system(size: 17, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 17)
                                .background(
                                    LinearGradient(
                                        colors: [Color(red: 0.72, green: 0.22, blue: 0.92), Color(red: 0.34, green: 0.08, blue: 0.72)],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 17))
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(22)
                    .background(.white.opacity(0.055))
                    .overlay(RoundedRectangle(cornerRadius: 24).stroke(.white.opacity(0.06), lineWidth: 1))
                    .clipShape(RoundedRectangle(cornerRadius: 24))

                    HStack(spacing: 12) {
                        Button(action: openDiscord) {
                            StatusCard(title: "Сообщество", value: "Discord", icon: "person.3.fill")
                        }
                        .buttonStyle(.plain)

                        Button {
                            // Эта карточка кликабельна и предназначена для будущего раздела информации.
                        } label: {
                            StatusCard(title: "Информация", value: "Подробнее", icon: "info.circle.fill")
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
            .scrollIndicators(.hidden)
            .background(Color.black.ignoresSafeArea())
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct StatusCard: View {
    let title: String
    let value: String
    let icon: String

    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(Color(red: 0.70, green: 0.35, blue: 1.0))

            Text(title)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.48))

            Text(value)
                .font(.headline)
                .foregroundStyle(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: .infinity, minHeight: 112, alignment: .leading)
        .padding(16)
        .background(.white.opacity(0.055))
        .overlay(RoundedRectangle(cornerRadius: 18).stroke(.white.opacity(0.06), lineWidth: 1))
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

struct InfoView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Nightwell") {
                    Button(action: openDiscord) {
                        Label("Открыть Discord", systemImage: "bubble.left.and.bubble.right.fill")
                    }
                    Button { } label: {
                        Label("Новости", systemImage: "newspaper.fill")
                    }
                    Button { } label: {
                        Label("Правила сообщества", systemImage: "list.bullet.rectangle.fill")
                    }
                }

                Section("Дополнительно") {
                    Button { } label: {
                        Label("Дополнительная информация", systemImage: "doc.text.fill")
                    }
                }
            }
            .navigationTitle("Информация")
            .scrollContentBackground(.hidden)
            .background(Color.black)
        }
    }
}

struct SettingsView: View {
    @AppStorage("notifications") private var notifications = true

    var body: some View {
        NavigationStack {
            Form {
                Section("Приложение") {
                    Toggle(isOn: $notifications) {
                        Label("Уведомления", systemImage: "bell.fill")
                    }
                }

                Section("Nightwell") {
                    Button(action: openDiscord) {
                        Label("Discord", systemImage: "bubble.left.and.bubble.right.fill")
                    }
                    Button { } label: {
                        Label("Обратная связь", systemImage: "envelope.fill")
                    }
                    HStack {
                        Label("Версия", systemImage: "app.badge")
                        Spacer()
                        Text("1.0.0").foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Настройки")
            .scrollContentBackground(.hidden)
            .background(Color.black)
        }
    }
}

private func openDiscord() {
    UIApplication.shared.open(discordURL)
}

#Preview {
    ContentView()
}
