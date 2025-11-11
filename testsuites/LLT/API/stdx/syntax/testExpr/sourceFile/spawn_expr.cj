func test(): Unit {
    spawn { =>
        println("New thread before sleeping")
        sleep(100 * Duration.millisecond)
        println("New thread after sleeping")
    }

    spawn (a) { =>
        sleep(Duration.second)
        return 1
    }
}