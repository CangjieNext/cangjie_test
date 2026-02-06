package javacallcj

foreign {
    func triggerCallback(code: Int32, cmsg: CString): Unit

    func triggerCallbackWithNewNativeThread(code: Int32, cmsg: CString): Unit

    func printJavaHello(): Unit

    func cppThrowsException(): Unit
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
        } catch (e: ExclusiveScopeException) {
            println("exception1 e.toString() = ${e}")
            println("exception1 e.message = ${e.message}")
            e.printStackTrace()
        }
        let result = exclusiveScope {
            123
        }
        println("result = ${result}")
    }
    // f.get()
    // println("exit spawn")
}
