package reflect_std

import std.reflect.*
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

@Test
public class TestStdReflect {
    // struct
    @TestCase
    func testString(): Unit {
        let s = StructTypeInfo.of("xxx")
        @Expect(s.name, "String")
        let f = s.getStaticFunction("fromUtf8", TypeInfo.of(Array<UInt8>()))
        let result = f.apply(s, Array<UInt8>(3, repeat: 76)) as String
        @Expect(result.getOrThrow(), "LLL")
    }
    // interface
    @TestCase
    func testToString(): Unit {
        let i = InterfaceTypeInfo.of<ToString>()
        let f = i.getInstanceFunction("toString")
        try {
            let result = f.apply(114514) as String
            @Assert(false)
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The abstract function cannot be applied.")
        }
    }
    @TestCase
    func testToString0(): Unit {
        // 114514.toString()
        let instance = ArrayList<String>()
        let i = ClassTypeInfo.of(instance)
        instance.toString()
        // let f = i.getInstanceFunction("toString")
        let r = i.instanceFunctions |> map {c: InstanceFunctionInfo => c.name} |> collectArray
        @Expect(r.toString(), "xxxx")
        // let result = f.apply(instance)
        // @Expect(result as String, Some("xxx"))
    }
}

main(): Int64 {
    println("hello world")
    return 0
}
