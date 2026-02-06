package javacallcj

foreign {
    func triggerCallback(code: Int32, cmsg: CString): Unit

    func triggerCallbackWithNewNativeThread(code: Int32, cmsg: CString): Unit

    func printJavaHello(): Unit

    func cppThrowsException(): Unit

    func javaThrowsException(): Unit
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
        }
        let result = exclusiveScope {
            123
        }
        println("result = ${result}")
        try {
            exclusiveScope {
                // 在C中抛异常
                unsafe {
                    cppThrowsException()
                }
            }
        } catch (e: Exception) {
            println("exception2 e.toString() = ${e}")
            println("exception2 e.message = ${e.message}")
        }
    }
    // f.get()
    // println("exit spawn")
}
