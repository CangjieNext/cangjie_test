package javacallcj

foreign {
    func triggerCallback(code: Int32, cmsg: CString): Unit
    func triggerCallbackWithNewNativeThread(code: Int32, cmsg: CString): Unit
    func printJavaHello(): Unit
}

public func callNative(): Unit {
    unsafe {
        // let cmsg = LibC.mallocCString("cangjie -> cpp -> java!")
        // triggerCallback(0, cmsg)
        // triggerCallbackWithNewNativeThread(0, cmsg)

        printJavaHello()
    }
}

@C
public func cjOnEvent(): Unit {
    spawn {
        println("enter spawn")
        exclusiveScope {
            callNative()
        }
    }
    // f.get()
    // println("exit spawn")
}