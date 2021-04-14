# LeanSDK

Lean's Link iOS SDK is a framework, distributed as a binary xcframework for simulators and iPhone devices, used by developers to let their end users connect their bank accounts through a series of easy steps in a friendly UI.

## Installation

### Swift Package Manager

To connect this repository to your project via [Swift Package Manager](https://swift.org/package-manager/). In XCode go to File > Swift Packages > Add Package Dependency and enter the URL for this repository.

Please note: You must have github connected to XCode for SPM to work.

### Manually

You can download the `LeanSDK.xcframework` file manually [here](https://cdn.leantech.me/link/sdk/ios/1.0.0/LeanSDK.xcframework-1.0.0.zip).

You can then add it to your project the same way you would with any other framework dependency.

## Usage with Swift UI

Once the package has been added to your project, you should initialize the SDK within your app. 

To get started call `Lean.manager.setup(appToken, sandbox)` this will set the application token and sandbox environment during runtime of your application.

```
// TestApp.Swift

import SwiftUI
import LeanSDK

@main
class LeanTestAppApp: App {
    
    required init() {
        Lean.manager.setup(
            appToken: "YOUR_APP_TOKEN",
            sandbox: true
        )
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

In Swift UI you must set up a `Lean.manager.view` for your further calls to populate into - in the example below you can see how to use `Lean.manager` to make a `link` call.

```
// ContentView.swift

import SwiftUI
import LeanSDK

struct ContentView: View {
    @State private var isPresented = false
    var linkPermissions = [LeanPermission.Identity, LeanPermission.Accounts,
                       LeanPermission.Transactions, LeanPermission.Balance]

    var body: some View {
        VStack {
            Button("Link", action: { handleLink() })
        }
    }
    .fullScreenCover(isPresented: $isPresented, content: {
        Lean.manager.view.ignoresSafeArea()
    })
}

func handleLink() {
    Lean.manager
            .link(customerId: "CUSTOMER_ID", permissions: linkPermissions, success: {
                print("Entity Linked")
                isPresented = false
            }, error: {
                print("Unable to Link")
                isPresented = false
            })
    isPresented = true
}
```

## Usage with View Controllers

When using LinkSDK with standard MVC swift - you must initialize the SDK and provide the SDK with a View Controller to present itself inside.

```
// ViewController.swift

import UIKit
import LeanSDK

class ViewController: UIViewController {  
    var linkPermissions = [LeanPermission.Identity, LeanPermission.Accounts,
                        LeanPermission.Transactions, LeanPermission.Balance]

    override func ViewDidLoad() {
        super.viewDidLoad()
        Lean.manager.setup(appToken: "YOUR_APP_TOKEN", sandbox: true)
    }
}
    @IBAction func handleLink(_sender: Any) {
        Lean.manager.link(presentingViewController: self, customerId: "CUSTOMER_ID", permissions: linkPermissions) {
            print("Entity Linked")
        } error: {
            print("Unable to Link")
        }
    }
```

### Methods

The LinkSDK has **4 methods** to connect and manage your customer's Accounts, Data and Payments.

Each of these methods is available through `Lean.manager.{METHOD}()`

#### .link()
`.link()` allows your customer to connect their bank account for the **Data** API - allowing you to access accounts, balances and transactions. To link an account for Payments, see the createPaymentSource() Method.

```
Lean.manager.link(
    presentingViewController: self: UIViewController, 
    customerId: "CUSTOMER_ID", 
    permissions: ArrayOf LeanPermissions,
    bankId: bankId? 
    success: {... executes code on success },
    error: {... executes code on failure }
)
```

LeanPermissions are an array of ENUMs available through the LeanSDK package. Available values are:
* LeanPermissions.Identity
* LeanPermissions.Accounts
* LeanPermission.Transactions
* LeanPermission.Balance

#### .reconnect()
`.reconnect()` allows you to reconnect and entity - when you make a call to the Data API that requires reconnection - you will receieve a `reconnect_id` for this flow.

```
Lean.manager.reconnect(
    presentingViewController: self, 
    reconnectId: reconnectId, 
    success: {... executes code on success },
    error: {... executes code on failure }
)
```

#### .createPaymentSource()
Create a payment source from your customer's bank account.

```
Lean.manager.createPaymentSource(
    presentingViewController: self, 
    customerId: customerId, 
    bankId: bankId?, 
    success: {... executes code on success },
    error: {... executes code on failure }
)
```

#### .pay()
Initiate a payment from a customer's bank account.

```
Lean.manager.pay(
    presentingViewController: self, 
    paymentIntentId: paymentIntentId,
    accountId: accountId, 
    success: {... executes code on success },
    error: {... executes code on failure }
)
```

You can read more in depth documentation by going to our [API Documentation](https://docs.leantech.me)
