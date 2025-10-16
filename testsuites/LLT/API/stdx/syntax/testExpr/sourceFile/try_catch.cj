func test(): Unit {
    try {
        var a = 1
        a += 1
    } catch (e: Exception) {}

    try {
        var b = 1
        b += 1
    } catch (e: ExceptionA | ExceptionB) {
        print(111)
        print(e)
    } catch(e: Error) {} finally {
        return ()
    }

    try (r1 = ResourceClass(), r2 = ResourceClass()) {}

    try {
        a
    } catch (e: Exception | IOException) {
        b
    } catch (_) {
        c
    }
}