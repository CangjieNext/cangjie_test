public open class P {
    public open func foo(): Unit {
        println("negative")
    }
}

public class S <: P {
    @When[os != "macOS" && arch == "aarch64"]
    public func foo(): Unit {
        println("positive")
    }
}

main(): Unit {
    S().foo()
}
