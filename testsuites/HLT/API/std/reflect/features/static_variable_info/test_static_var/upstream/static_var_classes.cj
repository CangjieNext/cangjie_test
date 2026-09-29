 package upstream
public class SimpleStaticVarClass {
public static var count: Int64 = 42i64

public static let label: String = "hello"

}
public class MutableOnlyStaticVarClass {
public static var value: String = ""

public static var number: Int64 = 0i64

}
public class ImmutableOnlyStaticVarClass {
public static let fixed: Int64 = 42i64

}
