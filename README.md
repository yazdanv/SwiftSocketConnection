# Swift Socket Connection, working with tcp in iOS and OSX without the pain

## Install

##### Cocoapods

add this to your target in Podfile

~~~~ ruby
pod 'SwiftSocketConnection', '0.1.0'
~~~~

then 

~~~~ bash
pod install
~~~~

on your project

##### Carthage

add this to your Cartfile

~~~~
github "ymazdy/SwiftSocketConnection"
~~~~

then 

~~~~~ bash
carthage update
~~~~~

on your project



## How To Use

##### Creating an instance

~~~~~ swift
let connection = SocketConnection("192.168.1.2", "8090")
~~~~~

when creating an intance the are many options that you can use

~~~~~ swift
let connection = SocketConnection(
	_ host: String,							// the host you are trying to reach (ex: google.com, 192.168.1.2)
	_ port: Int,							// the port you are connecting to (ex: 80, 8080, 65000)
	_ bufferSize: Int = 32768,				// the max buffer size for input data (defaults to 32768 which is 32KB good for most type of incoming data excluding images)
    connected: (() -> Void)? = nil,			// a handler for when the connection is established and both incoming and outgoing channels are available
    disconnected: (() -> Void)? = nil,		// a handler for when the connection is disconnected
    autoReconnect: Bool = true,				// whether to autoReconnect when the client is disconnected
	readTimeout: Double = 0.02,				// timeout for all read operations in seconds (you will get each data packet after the timeout to make sure no other data is left)
	sendDelay: Double = 0,					// delay between each send event in seconds, the send request would go in a q and would be proccesed after each other on the delay
	sendOnConnect: Bool = true,				// send all the data in q when client is reconncted
	retries: Int = 10						// retries for each reconnection attempts
	)
~~~~~



##### On Connection and Disconnection handler and Connecting to the host

~~~~~ swift
let connection = SocketConnection("192.168.1.2", "8090")
connection.onConnected {
	print("Connected")
}
connection.onDisconnected {
	print("disconnected")
}
connection.connect()
~~~~~


##### Getting the incoming data


receiving data in a Closure 

~~~~~ swift
let connection = SocketConnection("192.168.1.2", "8090")
connection.onData {(data: Data) in 
	print(data)
}
connection.connect()
~~~~~


receiving string in a Closure 

~~~~~ swift
let connection = SocketConnection("192.168.1.2", "8090")
connection.onString {(str: String) in 
	print(str)
}
connection.connect()
~~~~~


getting string until a certain delimiter

~~~~~ swift
let connection = SocketConnection("192.168.1.2", "8090")
connection.until(until: "delimiter", timeout: 1.5, {(str: String) in 
	print(str)
}, _ failed: {
	print("failed to get data")
})
connection.connect()
~~~~~


receiving string in with a delegate

first conform to delegate

~~~~~ swift
class MyClass: NSObject, SocketConnectionDelegate {

}
~~~~~

then implement the onString function in your class 

~~~~~ swift
func onString(string: String) {
	print(string)
}
~~~~~

then set connection delegate

~~~~~ swift
let connection = SocketConnection("192.168.1.2", "8090")
connection.delegate = self
connection.connect()
~~~~~


##### Send data

SwiftSocketConnection supports many types of outgoing data

* String
* Byte
* Byte Array
* Data
* Int
* Any Array (basicly any kind of data)


~~~~~ swift
let connection = SocketConnection("192.168.1.2", "8090")
connection.onString {(str: String) in 
	print(str)
}
connection.onConnected {
	let result1 = connection.send(int: 10)
	let result2 = connection.send(data: Data())
	let result3 = connection.send(byte: UInt8(1))
	let result4 = connection.send(bytes: [UInt8(1), UInt8(2), UInt8(3)])
	let result5 = connection.send(string: "hello")
	let result6 = connection.send(array: [1, UInt8(1), "hello", Data(), 10])
}
connection.connect()
~~~~~

each send request return a enum SocketResult

~~~~~ swift
public enum SocketResult: Int {
    case notConnected = -2			// socket is not connected and data would be sent upon connection (if the sendOnConnect parameter is set to true)
    case waiting = -1				// data is added to q for sending after delay
    case success = 1				// data was sent successfuly
    case unknown = 2				// unknown error occured (Contact support at ymazdy@gmail.com)
}
~~~~~




## Contributions

Contributions are always accepted as pull request

## Support 

Contact ymazdy@gmail.com

