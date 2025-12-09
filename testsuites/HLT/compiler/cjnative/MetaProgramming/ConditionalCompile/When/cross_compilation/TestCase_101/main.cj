public open class P {
    public open func foo(): Unit {
        println("negative")
    }
}

public class S <: P {
    @When[os != "Windows"]
    public func foo(): Unit {
        println("positive")
    }
}

main(): Unit {
    S().foo()
}
