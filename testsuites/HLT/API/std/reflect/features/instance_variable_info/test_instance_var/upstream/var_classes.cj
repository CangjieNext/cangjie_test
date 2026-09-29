 package upstream
public class SimpleVarClass {
public init() {
}
public var count: Int64 = 42i64

public let label: String = "hello"

}
public class VarOnlyClass {
public init() {
}
public var value: String = ""

public var number: Int64 = 0i64

}
public class LetOnlyClass {
public init() {
}
public let fixed: Int64 = 42i64

}
public abstract class AbstractVarShape {
public var state: Int64 = 0i64

}
public class AnnotatedVarClass {
public init() {
}
@VarAnnotation
public var annotatedVar: Int64 = 1i64

@VarAnnotation
@SecondVarAnnotation
public var multiAnnotatedVar: String = "multi"

@VarAnnotation
@VarAnnotation
public var duplicateAnnotatedVar: Bool = true

}
