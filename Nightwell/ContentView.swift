import SwiftUI
import UIKit

private let discordURL = URL(string: "https://discord.gg/EwXGkGET9Z")!

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Главная", systemImage: "house.fill")
                }

            InfoView()
                .tabItem {
                    Label("Информация", systemImage: "info.circle.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Настройки", systemImage: "gearshape.fill")
                }
        }
        .tint(Color(red: 0.67, green: 0.28, blue: 1.0))
        .preferredColorScheme(.dark)
        .toolbarBackground(.hidden, for: .tabBar)
    }
}

// MARK: - Главная

var body: some View {
    ZStack {
        Color.black
            .ignoresSafeArea()

        VStack(spacing: 0) {

                // Верхняя часть
                VStack(spacing: 5) {
                    Text("NWLL")
                        .font(
                            .system(
                                size: 54,
                                weight: .black,
                                design: .rounded
                            )
                        )
                        .tracking(3)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .white,
                                    Color(red: 0.73, green: 0.52, blue: 1.0),
                                    Color(red: 0.55, green: 0.18, blue: 1.0)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )

                    Text("N I G H T W E L L")
                        .font(
                            .system(
                                size: 10,
                                weight: .bold
                            )
                        )
                        .tracking(4)
                        .foregroundStyle(.white.opacity(0.38))
                }
                .padding(.top, 8)

                Spacer(minLength: 18)

                // Главная карточка
                VStack(alignment: .leading, spacing: 14) {

                    Text("Nightwell")
                        .font(
                            .system(
                                size: 26,
                                weight: .bold
                            )
                        )
                        .foregroundStyle(.white)

                    Text(
                        "Добро пожаловать в официальное приложение сообщества Nightwell."
                    )
                    .font(.system(size: 16))
                    .lineSpacing(1)
                    .foregroundStyle(.white.opacity(0.65))

                    Button(action: openDiscord) {
                        HStack(spacing: 10) {
                            Image(
                                systemName:
                                    "bubble.left.and.bubble.right.fill"
                            )

                            Text("Открыть Discord")
                        }
                        .font(
                            .system(
                                size: 17,
                                weight: .semibold
                            )
                        )
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(
                            LinearGradient(
                                colors: [
                                    Color(
                                        red: 0.72,
                                        green: 0.20,
                                        blue: 0.94
                                    ),
                                    Color(
                                        red: 0.35,
                                        green: 0.07,
                                        blue: 0.72
                                    )
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 15
                            )
                        )
                    }
                    .buttonStyle(.plain)
                }
                .padding(20)
                .frame(maxWidth: 600)
                .background(
                    Color(
                        red: 0.055,
                        green: 0.055,
                        blue: 0.065
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(
                            .white.opacity(0.07),
                            lineWidth: 1
                        )
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 22)
                )
                .padding(.horizontal, 16)

                Spacer(minLength: 18)

                // Две нижние карточки
                HStack(spacing: 12) {

                    Button(action: openDiscord) {
                        HomeCard(
                            icon: "person.3.fill",
                            title: "Сообщество",
                            value: "Discord"
                        )
                    }
                    .buttonStyle(.plain)

                    Button {
                        // Раздел информации
                    } label: {
                        HomeCard(
                            icon: "info.circle.fill",
                            title: "Информация",
                            value: "Подробнее"
                        )
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, 16)

                Spacer(minLength: 12)
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 8)
                    // Здесь оставь всё содержимое твоего текущего VStack
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    .ignoresSafeArea(.container, edges: [.top, .bottom])
}

// MARK: - Карточка

struct HomeCard: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 7) {

            Image(systemName: icon)
                .font(
                    .system(
                        size: 19,
                        weight: .semibold
                    )
                )
                .foregroundStyle(
                    Color(
                        red: 0.70,
                        green: 0.32,
                        blue: 1.0
                    )
                )

            Text(title)
                .font(.system(size: 12))
                .foregroundStyle(.white.opacity(0.45))

            Text(value)
                .font(
                    .system(
                        size: 16,
                        weight: .semibold
                    )
                )
                .foregroundStyle(.white)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .frame(height: 92)
        .padding(.horizontal, 15)
        .background(
            Color(
                red: 0.055,
                green: 0.055,
                blue: 0.065
            )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    .white.opacity(0.07),
                    lineWidth: 1
                )
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 18)
        )
    }
}

// MARK: - Информация

struct InfoView: View {
    var body: some View {
        NavigationStack {
            List {

                Section("Nightwell") {

                    Button(action: openDiscord) {
                        Label(
                            "Открыть Discord",
                            systemImage:
                                "bubble.left.and.bubble.right.fill"
                        )
                    }

                    Button {
                    } label: {
                        Label(
                            "Новости",
                            systemImage: "newspaper.fill"
                        )
                    }

                    Button {
                    } label: {
                        Label(
                            "Правила сообщества",
                            systemImage:
                                "list.bullet.rectangle.fill"
                        )
                    }
                }

                Section("Дополнительно") {

                    Button {
                    } label: {
                        Label(
                            "Дополнительная информация",
                            systemImage: "doc.text.fill"
                        )
                    }
                }
            }
            .navigationTitle("Информация")
            .scrollContentBackground(.hidden)
            .background(Color.black)
        }
    }
}

// MARK: - Настройки

struct SettingsView: View {

    @AppStorage("notifications")
    private var notifications = true

    var body: some View {
        NavigationStack {
            Form {

                Section("Приложение") {

                    Toggle(
                        isOn: $notifications
                    ) {
                        Label(
                            "Уведомления",
                            systemImage: "bell.fill"
                        )
                    }
                }

                Section("Nightwell") {

                    Button(action: openDiscord) {
                        Label(
                            "Discord",
                            systemImage:
                                "bubble.left.and.bubble.right.fill"
                        )
                    }

                    Button {
                    } label: {
                        Label(
                            "Обратная связь",
                            systemImage: "envelope.fill"
                        )
                    }

                    HStack {
                        Label(
                            "Версия",
                            systemImage: "app.badge"
                        )

                        Spacer()

                        Text("1.0.0")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Настройки")
            .scrollContentBackground(.hidden)
            .background(Color.black)
        }
    }
}

// MARK: - Discord

private func openDiscord() {
    UIApplication.shared.open(discordURL)
}

// MARK: - Preview

#Preview {
    ContentView()
}
