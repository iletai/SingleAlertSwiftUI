> [!IMPORTANT]  
> <h1>SwiftUI has issues in the case in a View has existed multi alert</h1>

<p>This example suggests the way to init alert on root view instead of creating multi alert on each View</p>

<p>Scaleable in case iOS 18, we also moving it to Dependency Injection to control same with DDD</p>

```swift
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
```

```swift
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
```
