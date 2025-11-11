main() {
    try (r = Worker("Tom")) {
        r.getTools()
        r.work()
    }
}