 package upstream
public interface PlainInterface {
}
public interface RichInterface {
func area(): Int64  

func describe(prefix: String): String  

}
public sealed interface SealedInterface {
func name(): String  

}
public class Circle <:SealedInterface {
public var radius: Int64 = 5i64

public init() {
}
public func name(): String  {
return "Circle"
}

}
public class Square <:SealedInterface {
public var side: Int64 = 4i64

public init() {
}
public func name(): String  {
return "Square"
}

}
