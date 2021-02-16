# LeanSDK

Lean's Link iOS SDK is a framework, distributed as a binary xcframework for simulator's and iPhone devices, used by developers to let their end users connect their bank accounts through a series of easy steps in a friendly UI.

## Installation

### Swift Package Manager

To connect this repository to your project via [Swift Package Manager](https://swift.org/package-manager/). In XCode go to File > Swift Packages > Add Package Dependency and enter the URL for this repository.

Please note: You must have github connected to XCode for SPM to work.

### Manually

You can download the `LeanSDK.xcframework` file manually [here](https://cdn.leantech.me/link/sdk/ios/0.0.9/LeanSDK.xcframework-0.0.9.zip).

You can then add it to your project the same way you would with any other framework dependency.

## Usage

Once the LeanSDK is integrated with your platform you can import it into a Swift UIViewController Class like so:

```
import UIKit
import LeanSDK

class ViewController: UIViewController {
    var leanSDK:LeanSDKInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            leanSDK = LeanSDKInterface()
        }
    }
}
```

### Method

The LinkSDK has **4 methods** to connect and manage your customer's Accounts, Data and Payments.

Please ensure that you pass in the root view controller that the SDK is being initialized in if you're not calling the method from within the view.

#### .link()
`.link()` allows your customer to connect their bank account to your platform

```
leanSDK.link(
    appToken: "YOUR_APP_ID", 
    appUserID: "some_user_id", 
    permissions: [.accounts,.balance,.identity,.transactions], 
    showLogs: true, 
    sandbox: true, 
    rootController: self
)
```

#### .reconnect()
`.reconnect()` allows you to reconnect and entity - when you make a call to the Data API that requires reconnection - you will receieve a `reconnect_id` for this flow.

```
leanSDK.reconnect(
    reconnectID: "4a2107d3-3bbd-410c-a92d-b0d43d782454", 
    appToken: "YOUR_APP_ID", 
    successURL: "myapp://myapp.com/success", 
    failURL: "myapp://myapp.com/success", 
    sandbox: true, 
    showLogs: true, 
    rootController: self
)
```

#### .createPaymentSource()
Create a payment source from your customer's bank account.

```
leanSDK.createPaymentSource(
    customerID: "3d42bb66-d12c-41f8-83f9-110016dd6a09", 
    appToken: "YOUR_APP_ID", 
    successURL: "myapp://myapp.com/success", 
    failURL: "myapp://myapp.com/success", 
    showLogs: true,
    rootController: self
)
```

#### .pay()
Initiate a payment from a customer's bank account.

```
leanSDK.pay(
    appToken: "YOUR_APP_ID", 
    paymentIntentID: "a2b01c69-c436-4a84-b950-11fb3914c5b8", 
    failURL:  "myapp://myapp.com/success", 
    successURL:  "myapp://myapp.com/success", 
    showLogs: true,
    rootController: self
)
```

You can read more in depth documentation by going to our [API Documentation](https://docs.leantech.me)
