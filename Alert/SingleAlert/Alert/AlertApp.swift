//
//  AlertApp.swift
//  Alert
//
//  Created by Lê Quang Trọng Tài on 10/22/24.
//

import SwiftUI

@main
struct AlertApp: App {
    @StateObject var alertController = AlertAppState()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onShowAlert(with: $alertController.alert)
        }
        .environmentObject(alertController)
    }
}

extension View {
    fileprivate func onShowAlert(with alert: Binding<AlertObject?>) -> some View {
        modifier(SingleAlertViewModifier(alert: alert))
    }
}
