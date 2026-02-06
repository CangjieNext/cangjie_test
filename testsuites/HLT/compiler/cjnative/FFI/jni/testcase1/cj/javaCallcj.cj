package javacallcj

foreign {
    func triggerCallback(code: Int32, cmsg: CString): Unit

    func triggerCallbackWithNewNativeThread(code: Int32, cmsg: CString): Unit

    func printJavaHello(msg: CString): Unit

    func cppThrowsException(): Unit
}

@C
public func cjOnEvent(): Unit {
    for (i in 0..10) {
        spawn {
            for (j in 0..10) {
                exclusiveScope {
                    unsafe {
                        printJavaHello(LibC.mallocCString("${i} ${j}"))
                    }
                }
            }
        }
    }
}
