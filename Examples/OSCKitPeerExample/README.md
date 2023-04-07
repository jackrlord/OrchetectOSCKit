# OSCKit Peer Example

This example demonstrates a less-common use case of bidirectional OSC communication where server and client use the same UDP port.

## Entitlements

If you are adding OSCKit to a macOS project that has the Sandbox entitlement, ensure that the network options are enabled. These entitlement options are already set in the example project.

![sandbox-network-connections](Images/sandbox-network-connections.png)

## Build Note

If Xcode builds but the app does not run, it may be because Xcode is defaulting to the wrong Scheme. Ensure the example app's Scheme is selected then try again.
