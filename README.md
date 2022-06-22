# LeanSDK

**This SDK supports iOS 13+ and requires XCode 12.5.X and above**

Lean's Link iOS SDK is a framework, distributed as a binary xcframework for simulators and iPhone devices, used by developers to let their end users connect their bank accounts through a series of easy steps in a friendly UI.

## Installation

### Swift Package Manager

To connect this repository to your project via [Swift Package Manager](https://swift.org/package-manager/). In XCode go to File > Swift Packages > Add Package Dependency and enter the URL for this repository.

Please note: You must have github connected to XCode for SPM to work.

### Manually

You can download the `LeanSDK.xcframework` file manually [here](https://cdn.leantech.me/link/sdk/ios/1.0.4/LeanSDK.xcframework-1.0.4.zip).

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
            sandbox: true,
            version: "1.24.0",
            language: nil
        )
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

In Swift UI you must set up a `LeanView` for your further calls to populate into. You can do this with `Lean.manager.generateView()` - in the example below you can see how to use `Lean.manager` to make a `link` call.

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
        .fullScreenCover(isPresented: $isPresented, content: {
            Lean.manager.generateView().ignoresSafeArea()
        })
    }

    func handleLink() {
    Lean.manager
            .link(customerId: String, permissions: linkPermissions,
            customization: LeanCustomization?,
            success: { (status) in
                print("Entity Linked")
                print(status.status)
                isPresented = false
            }, error: { (status) in
                print(status.status)
                print(status.message!)
                print(status.method)
                isPresented = false
            })
    isPresented = true
}
}
```

### Setting the version

Version takes a `String` and can point to either a specific SDK version i.e. `"1.24.0"` or an alias i.e. `"latest"`.

We recommend passing in a specific version to ensure stability in the case that a change to the SDK breaks your application.

`latest` is subject to change at relatively short notice - but does allow for any bugfixes to shipped over the air - meaning fixes can be applied without the need to resubmit your application to the app store.

A QA version of the SDK is available with `next-release` and should only be used in test applications to ensure that the next `latest` patch will not break your implementation of the LinkSDK.

### Setting the language

`language` is set in `Lean.manager.setup`. It is optional and defaults to `nil`, in which case it will default to English.

If you wish to provide a value you can provide a `String` either `"en"` for English, `"ar"` for Arabic.

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
        Lean.manager.setup(appToken: "YOUR_APP_TOKEN", sandbox: true, version: "1.3.2")
    }
}
        @IBAction func handleLink(_ sender: Any) {
        Lean.manager.link(presentingViewController: self, customerId: CUSTOMER_ID, permissions: linkPermissions, bankId: nil, success: { status in
            print("Entity Linked")
        }, error: { status in
            print(status.status)
        })
    }
```

## Methods

The LinkSDK has **5 methods** to connect and manage your customer's Accounts, Data and Payments.

Each of these methods is available through `Lean.manager.{METHOD}()`

#### .link()

`.link()` allows your customer to connect their bank account for the **Data** API - allowing you to access accounts, balances and transactions. To link an account for Payments, see the createPaymentSource() Method.

```
Lean.manager.link(
    presentingViewController: self: UIViewController,
    customerId: String,
    permissions: Array<LeanPermissions>,
    bankId: bankId?
    customization: LeanCustomization?,
    success: { (status) in ... executes code on success },
    error: { (status) in ... executes code on failure }
)
```

LeanPermissions are an array of ENUMs available through the LeanSDK package. Available values are:

- LeanPermissions.Identity
- LeanPermissions.Accounts
- LeanPermission.Transactions
- LeanPermission.Balance

#### .reconnect()

`.reconnect()` allows you to reconnect and entity - when you make a call to the Data API that requires reconnection - you will receieve a `reconnect_id` for this flow.

```
Lean.manager.reconnect(
    presentingViewController: self,
    reconnectId: reconnectId,
    customization: LeanCustomization?,
    success: { (status) in ... executes code on success },
    error: { (status) in ... executes code on failure }
)
```

#### .createPaymentSource()

Create a payment source from your customer's bank account.

```
Lean.manager.createPaymentSource(
    presentingViewController: self,
    customerId: customerId,
    bankId: bankId?,
    customization: LeanCustomization?,
    success: { (status) in ... executes code on success },
    error: { (status) in ... executes code on failure }
)
```

#### .pay()

Initiate a payment from a customer's bank account.

```
Lean.manager.pay(
    presentingViewController: self,
    paymentIntentId: paymentIntentId,
    accountId: accountId?,
    customization: LeanCustomization?,
    success: { (status) in ... executes code on success },
    error: { (status) in ... executes code on failure }
)
```

#### .connect()

Connect a bank account and create an `Entity` for the Data API and a `Payment Source` for the Payment API with a single sign on.

```
Lean.manager.connect(
    presentingViewController: self: UIViewController,
    customerId: String,
    permissions: Array<LeanPermissions>,
    bankId: bankId?
    paymentDestinationId: paymentDestinationId?
    customization: LeanCustomization?,
    success: { (status) in ... executes code on success },
    error: { (status) in ... executes code on failure }
)
```

LeanPermissions are an array of ENUMs available through the LeanSDK package. Available values are:

- LeanPermissions.Identity
- LeanPermissions.Accounts
- LeanPermission.Transactions
- LeanPermission.Balance
- LeanPermission.Payments

## Responses

Success responses will allow you to execute code upon the success of the LinkSDK flow you have called.

Error responses return a `struct` with the following details:

```
struct LeanStatus {
    method: String,
    status: String,
    message: String?,
    lastApiResponse: String?,
    exitPoint: String?,
    secondaryStatus: String?,
    bankDetails: {
      bankIdentifier: String?,
      isSupported: Bool?
    }
}
```

| Attribute                  | Description                                                                                                   |
| -------------------------- | ------------------------------------------------------------------------------------------------------------- |
| method                     | The method called by the SDK, can be `LINK`, `RECONNECT`, `CREATE_PAYMENT_SOURCE` or `PAY`                    |
| status                     | The end status of the call, can be `ERROR` or `CANCELLED` - if cancelled this means the user exited the flow. |
| message                    | Further details on the reason for the error, or where the user exited the flow. This is an optional.          |
| lastApiResponse            | The last API response status recieved from Lean. This is an optional.                                         |
| exitPoint                  | The last screen shown before the user closed the SDK                                                          |
| secondaryStatus            | More details on the main status - for example INVALID_CREDENTIALS                                             |
| bankDetails.bankIdentifier | The ID of the selected bank                                                                                   |
| bankDetails.isSupported    | Whether the selected bank is supported or not                                                                 |

You can read more in depth documentation by going to our [API Documentation](https://docs.leantech.me)

## Customization

You can customize the UI of LinkSDK using `LeanCustomization`.

Colors should be provided as valid CSS color formats - color name, HEX, RGB, RBGA (comma separated)

```
var customConfig = LeanCustomization(
    buttonTextColor: String?,
    buttonBorderRadius: String?,
    linkColor: String?,
    overlayColor: String?,
    themeColor: String?,
    dialogMode: String?
)
```

```
Lean.manager.link(
...
    customization: customConfig,
...
   )

```

### Accepted color strings

| Type | Value                   |
| ---- | ----------------------- |
| Name | `"blue"`                |
| Hex  | `"#0000ff"`             |
| RGB  | `"rgb(0,0,255)"`        |
| RGBA | `"rgba(0,0,0,255,0.5)"` |
