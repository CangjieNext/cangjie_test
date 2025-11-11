func test(): Unit {
    synchronized (obj) {
        while (true) {
            obj.wait()
        }
    }
}