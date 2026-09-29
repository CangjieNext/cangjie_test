 package upstream
public class SimplePropClass {
public init() {
}
private var _count: Int64 = 0i64

public  prop label: String {
get() {
"default-label"
}

}

public mut  prop count: Int64 {
get() {
this._count
}
set(v){
this._count = v
}
}

}
public class MutableOnlyPropClass {
public init() {
}
private var _value: String = ""

public mut  prop value: String {
get() {
this._value
}
set(v){
this._value = v
}
}

}
public class ImmutableOnlyPropClass {
public init() {
}
public  prop fixed: Int64 {
get() {
42i64
}

}

}
public open class OpenPropShape {
public open  prop hook: Int64 {
get() {
7i64
}

}

public  prop plain: Int64 {
get() {
8i64
}

}

}
public abstract class AbstractPropShape {
public  prop property1: Int64 {
get() {
42i64
}

}

public  prop property2: Int64

}
