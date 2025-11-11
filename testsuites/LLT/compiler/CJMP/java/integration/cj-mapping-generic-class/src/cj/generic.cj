package genericClass

public interface Printable {
    func printType(): String
}

public class GenericClass<T> where T <: Printable {

    private var value: T
    public GenericClass(v: T) {
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

extend Float <: Printable {
    public func printType(): String {
        return "Float(${this})"
    }
}

extend Int32 <: Printable {
    public func printType() : String {
        return "Int32(${this})"
    }
}