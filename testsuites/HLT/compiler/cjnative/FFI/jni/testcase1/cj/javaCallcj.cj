package javacallcj

foreign {
    func triggerCallback(code: Int32, cmsg: CString): Unit

    func triggerCallbackWithNewNativeThread(code: Int32, cmsg: CString): Unit

    func printJavaHello(): Unit
}

@C
public func cjOnEvent(): Unit {
    spawn {
        println("enter spawn")
        exclusiveScope {
            unsafe {
                let cmsg = LibC.mallocCString("cangjie -> cpp -> java!")
                triggerCallback(0, cmsg)
                triggerCallbackWithNewNativeThread(0, cmsg)
                printJavaHello()
            }
        }
        try {
            exclusiveScope {
                throw Exception("my info")
            }
        } catch (e: Exception) {
            println("exception1 = ${e}")
        }
        try {
            exclusiveScope {
                // 在C中抛异常
                
            }
        } catch (e: Exception) {
            println("exception2 = ${e}")
        }
    }
    // f.get()
    // println("exit spawn")
}
