//
//  ContentView.swift
//  Alert
//
//  Created by Lê Quang Trọng Tài on 10/22/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var alertAppState: AlertAppState

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button {
                alertAppState.setShowAlert(
                    AlertObject(
                        title: "Example",
                        buttonTitle: "OK",
                        buttonCancelTitle: "Cancel",
                        message: "Example",
                        action: {
                            print("OKK")
                        },
                        actionCancel: {
                            print("cancel")
                        }
                    )
                )
            } label: {
                Text("Test")
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
