public open class P {
    public open func foo(): Unit {
        println("negative")
    }
}

public class S <: P {
    @When[os != "Windows" && arch != "x86_64" && env != "ohos"]
    public func foo(): Unit {
        println("positive")
    }
}

main(): Unit {
    S().foo()
}
