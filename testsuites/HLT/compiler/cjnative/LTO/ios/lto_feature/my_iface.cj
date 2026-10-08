package my_iface
public interface IGreeter {
    func greet(): String
}
public class EnglishGreeter <: IGreeter {
    public func greet(): String {
        return "Hello"
    }
}
public func useGreeter(g: IGreeter): String {
    return g.greet()
}
public func deadIfaceFunc(): String {
    return "dead"
}
