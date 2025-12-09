public open class P {
    public open func foo(): Unit {
        println("negative")
    }
}

public class S <: P {
    @When[os == "Linux" && arch == "aarch64" && env == "android"]
    public func foo(): Unit {
        println("positive")
    }
}

main(): Unit {
    S().foo()
}
