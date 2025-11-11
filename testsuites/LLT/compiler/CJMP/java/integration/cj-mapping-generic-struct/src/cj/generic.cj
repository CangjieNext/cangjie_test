package genericStruct

public interface Printable {
    func printType(): String
}

public class GenericStruct<T> where T <: Printable {

    private var value: T
    public GenericStruct(v: T) {
        value = v
    }

    public func getValue() : T {
        println(this.value.printType())
        return this.value
    }

    public func setValue(t: T) {
        value = T
        println(this.value.printType())
    }
}

extend Double <: Printable {
    public func printType(): String {
        return "Double(${this})"
    }
}

extend Int64 <: Printable {
    public func printType() : String {
        return "Long(${this})"
    }
}