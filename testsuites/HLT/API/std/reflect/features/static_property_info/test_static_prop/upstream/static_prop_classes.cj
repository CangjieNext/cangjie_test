 package upstream
public class SimpleStaticPropClass {
static public  prop label: String {
get() {
"default-static-label"
}

}

private static var _count: Int64 = 0i64

static public mut  prop count: Int64 {
get() {
SimpleStaticPropClass._count
}
set(v){
SimpleStaticPropClass._count = v
}
}

}
public class MutableOnlyStaticPropClass {
private static var _value: String = ""

static public mut  prop value: String {
get() {
MutableOnlyStaticPropClass._value
}
set(v){
MutableOnlyStaticPropClass._value = v
}
}

}
public class ImmutableOnlyStaticPropClass {
static public  prop fixed: Int64 {
get() {
42i64
}

}

}
