//
//  SingleAlertViewModifier.swift
//  Alert
//
//  Created by Lê Quang Trọng Tài on 10/22/24.
//

import Foundation
import SwiftUI

struct SingleAlertViewModifier: ViewModifier {
    @Binding var alert: AlertObject?

    func body(content: Content) -> some View {
        content
            .alert(
                alert?.title ?? "",
                isPresented: .constant(alert != nil)
            ) {
                Button(
                    alert?.buttonTitle ?? "OK",
                    role: nil
                ) {
                    alert?.action?()
                    alert = nil
                }
                if let cancel = alert?.actionCancel {
                    Button(alert?.buttonCancelTitle ?? "Dissmiss", role: .cancel) {
                        cancel()
                        alert = nil
                    }
                }
            } message: {
                Text(alert?.message ?? "")
            }
    }
}
