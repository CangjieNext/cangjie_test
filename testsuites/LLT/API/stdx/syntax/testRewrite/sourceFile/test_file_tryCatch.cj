main() {
    try (r = Worker("Tom")) {
        r.getTools()
        r.work()
    }

    // comment 1
    // comment 2
    try {
        return foo(a, b)
    } catch (a: AException) {
        logger.error("error A")
        throw a
    } catch (b: BException) {
        logger.error("error B")
        throw b
    } catch (ex: Exception) {
        throw ex
    }
}