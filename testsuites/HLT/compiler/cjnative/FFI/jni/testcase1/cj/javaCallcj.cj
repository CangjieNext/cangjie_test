package javacallcj

foreign {
    func triggerCallback(code: Int32, cmsg: CString): Unit

    func triggerCallbackWithNewNativeThread(code: Int32, cmsg: CString): Unit

    func printJavaHello(msg: CString): Unit

    func cppThrowsException(): Unit
}

@C
public func cjOnEvent(): Unit {
    spawn {
        exclusiveScope {
            unsafe {
                printJavaHello(LibC.mallocCString("1"))
            }
        }
    }
}
