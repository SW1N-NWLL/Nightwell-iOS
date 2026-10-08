import SwiftUI
import UIKit

private let discordURL = URL(string: "https://discord.gg/EwXGkGET9Z")!

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView().tabItem { Label("Главная", systemImage: "house.fill") }
            InfoView().tabItem { Label("Информация", systemImage: "info.circle.fill") }
            SettingsView().tabItem { Label("Настройки", systemImage: "gearshape.fill") }
        }
        .tint(Color(red: 0.68, green: 0.30, blue: 1.0))
        .preferredColorScheme(.dark)
    }
}

struct HomeView: View {
    var body: some View {
        GeometryReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    VStack(spacing: 5) {
                        Text("NWLL")
                            .font(.system(size: min(proxy.size.width * 0.15, 58), weight: .black, design: .rounded))
                            .tracking(4)
                            .foregroundStyle(LinearGradient(colors: [.white, Color(red: 0.73, green: 0.52, blue: 1.0), Color(red: 0.57, green: 0.20, blue: 1.0)], startPoint: .leading, endPoint: .trailing))
                        Text("N I G H T W E L L")
                            .font(.system(size: 11, weight: .semibold))
                            .tracking(4)
                            .foregroundStyle(.white.opacity(0.38))
                    }
                    .padding(.top, 14)

                    VStack(alignment: .leading, spacing: 15) {
                        Text("Nightwell")
                            .font(.system(size: 27, weight: .bold))
                        Text("Добро пожаловать в официальное приложение сообщества Nightwell.")
                            .font(.system(size: 17))
                            .lineSpacing(2)
                            .foregroundStyle(.white.opacity(0.64))
                            .fixedSize(horizontal: false, vertical: true)
                        Button(action: openDiscord) {
                            Label("Открыть Discord", systemImage: "bubble.left.and.bubble.right.fill")
                                .font(.system(size: 17, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 54)
                                .background(LinearGradient(colors: [Color(red: 0.72, green: 0.20, blue: 0.94), Color(red: 0.35, green: 0.07, blue: 0.72)], startPoint: .leading, endPoint: .trailing))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(20)
                    .background(Color.white.opacity(0.055))
                    .overlay(RoundedRectangle(cornerRadius: 22).stroke(Color.white.opacity(0.07), lineWidth: 1))
                    .clipShape(RoundedRectangle(cornerRadius: 22))

                    HStack(spacing: 12) {
                        Button(action: openDiscord) {
                            SmallCard(icon: "person.3.fill", title: "Сообщество", value: "Discord")
                        }
                        .buttonStyle(.plain)
                        Button {} label: {
                            SmallCard(icon: "info.circle.fill", title: "Информация", value: "Подробнее")
                        }
                        .buttonStyle(.plain)
                    }
                    Spacer(minLength: 8)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 18)
                .frame(maxWidth: 600)
                .frame(minHeight: proxy.size.height, alignment: .top)
            }
            .background(Color.black)
        }
        .background(Color.black)
    }
}

struct SmallCard: View {
    let icon: String
    let title: String
    let value: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 19, weight: .semibold))
                .foregroundStyle(Color(red: 0.70, green: 0.32, blue: 1.0))
            Text(title).font(.system(size: 13)).foregroundStyle(.white.opacity(0.45))
            Text(value).font(.system(size: 16, weight: .semibold)).foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 105)
        .padding(.horizontal, 15)
        .background(Color.white.opacity(0.055))
        .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white.opacity(0.07), lineWidth: 1))
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}

struct InfoView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Nightwell") {
                    Button(action: openDiscord) { Label("Открыть Discord", systemImage: "bubble.left.and.bubble.right.fill") }
                    Button {} label: { Label("Новости", systemImage: "newspaper.fill") }
                    Button {} label: { Label("Правила сообщества", systemImage: "list.bullet.rectangle.fill") }
                }
                Section("Дополнительно") {
                    Button {} label: { Label("Дополнительная информация", systemImage: "doc.text.fill") }
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
                    Toggle(isOn: $notifications) { Label("Уведомления", systemImage: "bell.fill") }
                }
                Section("Nightwell") {
                    Button(action: openDiscord) { Label("Discord", systemImage: "bubble.left.and.bubble.right.fill") }
                    Button {} label: { Label("Обратная связь", systemImage: "envelope.fill") }
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

private func openDiscord() { UIApplication.shared.open(discordURL) }

#Preview { ContentView() }
