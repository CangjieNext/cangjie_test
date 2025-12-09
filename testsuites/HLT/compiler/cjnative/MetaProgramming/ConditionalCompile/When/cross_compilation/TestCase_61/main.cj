public open class P {
    public open func foo(): Unit {
        println("negative")
    }
}

public class S <: P {
    @When[os != "Linux" && arch != "x86_64"]
    public func foo(): Unit {
        println("positive")
    }
}

main(): Unit {
    S().foo()
}
