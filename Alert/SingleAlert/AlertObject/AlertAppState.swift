//
//  AlertAppState.swift
//  Alert
//
//  Created by Lê Quang Trọng Tài on 10/22/24.
//

import Combine
import Foundation

@MainActor
final class AlertAppState: ObservableObject {
    @Published var alert: AlertObject?

    nonisolated init() {}

    func setShowAlert(_ alert: AlertObject) {
        self.alert = alert
    }
}

struct AlertObject {
    let title: String
    let buttonTitle: String
    let buttonCancelTitle: String
    let message: String
    let action: (() -> Void)?
    let actionCancel: (() -> Void)?
}
