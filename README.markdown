Repo Notes
==============
The branch `DeviceBroken` uses JSONKit sources that rely on the `+load` message being sent to the `JKDictionary` and `JKArray` class for initialisation required for the "create" class methods.

When building JSONKit into a static library, wrapped in a framework the runtime on a device (in my case iPhone4 iOS 4.3.3) the runtime is not sending the `+load` message to the class, and the "create" methods are failing their assertion for non-null class definitions and non-zero class sizes.

The branch `DeviceFixed` tests for the required class variables being uninitialised, and forces a call to `+load`, preventing the assertion failure on device.

Also, the Framework target was created and configured as per the steps here – http://simplyitinc.blogspot.com/2011/04/creating-static-framework-in-xcode-4.html

Running The Demo
==============

* Open **"Demo.xcworkspace"** in Xcode 4
* Select a the *"iPhone 4.3 Simulator"* scheme of the *"Demo App"* target
* Click **"Read Name"** in the Demo App

In both `DeviceBroken` and `DeviceFixed` branches the "name" string value contained in `data.json` is presented as an alert message.

* Select the scheme for your device (i.e. Rob's iPhone) of the *"Demo App"* target
* Click **"Read Name"** in the Demo App

In the `DeviceFixed` branch the alert message displays the `data.json` name value.

In the `DeviceBroken` branch, the following backtrace is generated:


    Demo App[459:707] *** Assertion failure in JKArray *_JKArrayCreate(id *, NSUInteger, BOOL)(), /Users/rob/Documents/Projects/temp/JSONKit-in-framework-demo/WrapperLibrary/WrapperLib/JSONKit.m:642
    Demo App[459:707] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'Invalid parameter not satisfying: (objects != NULL) && (_JKArrayClass != NULL) && (_JKArrayInstanceSize > 0UL)'
    *** Call stack at first throw:
    (
    	0   CoreFoundation                      0x30b5564f __exceptionPreprocess + 114
    	1   libobjc.A.dylib                     0x34670c5d objc_exception_throw + 24
    	2   CoreFoundation                      0x30b55491 +[NSException raise:format:arguments:] + 68
    	3   Foundation                          0x343de51d -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:] + 52
    	4   Demo App                            0x000140e1 _JKArrayCreate + 216
    	5   Demo App                            0x00013623 jk_parse_array + 798
    	6   Demo App                            0x00011b63 jk_object_for_token + 138
    	7   Demo App                            0x00013099 jk_parse_dictionary + 1436
    	8   Demo App                            0x00011b51 jk_object_for_token + 120
    	9   Demo App                            0x0001057b json_parse_it + 186
    	10  Demo App                            0x00008979 _JKParseUTF8String + 428
    	11  Demo App                            0x00008795 -[JSONDecoder objectWithUTF8String:length:error:] + 188
    	12  Demo App                            0x00008b2d -[JSONDecoder objectWithData:error:] + 172
    	13  Demo App                            0x00016b59 -[MyWrapper readName:] + 100
    	14  Demo App                            0x00002dff -[Demo_AppViewController readName:] + 254
    	15  CoreFoundation                      0x30ac5571 -[NSObject(NSObject) performSelector:withObject:withObject:] + 24
    	16  UIKit                               0x30bd3ec9 -[UIApplication sendAction:to:from:forEvent:] + 84
    	17  UIKit                               0x30bd3e69 -[UIApplication sendAction:toTarget:fromSender:forEvent:] + 32
    	18  UIKit                               0x30bd3e3b -[UIControl sendAction:to:forEvent:] + 38
    	19  UIKit                               0x30bd3b8d -[UIControl(Internal) _sendActionsForEvents:withEvent:] + 356
    	20  UIKit                               0x30bd4423 -[UIControl touchesEnded:withEvent:] + 342
    	21  UIKit                               0x30bd2bf5 -[UIWindow _sendTouchesForEvent:] + 368
    	22  UIKit                               0x30bd256f -[UIWindow sendEvent:] + 262
    	23  UIKit                               0x30bbb313 -[UIApplication sendEvent:] + 298
    	24  UIKit                               0x30bbac53 _UIApplicationHandleEvent + 5090
    	25  GraphicsServices                    0x3043ee77 PurpleEventCallback + 666
    	26  CoreFoundation                      0x30b2ca97 __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE1_PERFORM_FUNCTION__ + 26
    	27  CoreFoundation                      0x30b2e83f __CFRunLoopDoSource1 + 166
    	28  CoreFoundation                      0x30b2f60d __CFRunLoopRun + 520
    	29  CoreFoundation                      0x30abfec3 CFRunLoopRunSpecific + 230
    	30  CoreFoundation                      0x30abfdcb CFRunLoopRunInMode + 58
    	31  GraphicsServices                    0x3043e41f GSEventRunModal + 114
    	32  GraphicsServices                    0x3043e4cb GSEventRun + 62
    	33  UIKit                               0x30be5d69 -[UIApplication _run] + 404
    	34  UIKit                               0x30be3807 UIApplicationMain + 670
    	35  Demo App                            0x000028b3 main + 82
    	36  Demo App                            0x0000285c start + 40
    )
    terminate called after throwing an instance of 'NSException'
