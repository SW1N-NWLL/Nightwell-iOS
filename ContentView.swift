import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

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
            .tint(Color(red: 0.65, green: 0.25, blue: 1.0))
        }
    }
}

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Spacer(minLength: 30)

                Text("NWLL")
                    .font(.system(size: 64, weight: .black, design: .rounded))
                    .tracking(8)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.white, Color(red: 0.68, green: 0.28, blue: 1)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )

                Text("NIGHTWELL")
                    .font(.caption.weight(.bold))
                    .tracking(5)
                    .foregroundStyle(.white.opacity(0.45))

                VStack(alignment: .leading, spacing: 14) {
                    Text("Nightwell")
                        .font(.title2.bold())

                    Text("Добро пожаловать в официальное приложение сообщества Nightwell.")
                        .foregroundStyle(.white.opacity(0.65))
                        .fixedSize(horizontal: false, vertical: true)

                    Button {
                        guard let url = URL(string: "https://discord.gg/ZFBPxd5Ece") else { return }
                        UIApplication.shared.open(url)
                    } label: {
                        Label("Открыть Discord", systemImage: "bubble.left.and.bubble.right.fill")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(
                                    colors: [Color.purple, Color(red: 0.35, green: 0.08, blue: 0.65)],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                }
                .padding(22)
                .background(.white.opacity(0.06))
                .clipShape(RoundedRectangle(cornerRadius: 24))

                HStack(spacing: 12) {
                    StatusCard(title: "Сервер", value: "ONLINE", icon: "circle.fill")
                    StatusCard(title: "Участники", value: "NIGHTWELL", icon: "person.3.fill")
                }
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}

struct StatusCard: View {
    let title: String
    let value: String
    let icon: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: icon)
                .foregroundStyle(Color.purple)

            Text(title)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.5))

            Text(value)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

struct InfoView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Nightwell") {
                    Label("Сообщество", systemImage: "person.3.fill")
                    Label("Discord", systemImage: "bubble.left.and.bubble.right.fill")
                    Label("Новости", systemImage: "newspaper.fill")
                }

                Section("Дополнительно") {
                    Text("Здесь можно разместить правила, новости, ссылки и другую информацию о Nightwell.")
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Информация")
        }
        .scrollContentBackground(.hidden)
        .background(Color.black)
        .foregroundStyle(.white)
    }
}

struct SettingsView: View {
    @AppStorage("notifications") private var notifications = true

    var body: some View {
        NavigationStack {
            Form {
                Section("Приложение") {
                    Toggle("Уведомления", isOn: $notifications)
                }

                Section("Nightwell") {
                    HStack {
                        Text("Версия")
                        Spacer()
                        Text("1.0.0").foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Настройки")
        }
        .scrollContentBackground(.hidden)
        .background(Color.black)
    }
}

#Preview {
    ContentView()
}
