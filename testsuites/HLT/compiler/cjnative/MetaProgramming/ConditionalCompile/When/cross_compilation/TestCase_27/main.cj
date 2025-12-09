public open class P {
    public open func foo(): Unit {
        println("negative")
    }
}

public class S <: P {
    @When[os == "Linux" && env == "ohos"]
    public func foo(): Unit {
        println("positive")
    }
}

main(): Unit {
    S().foo()
}
