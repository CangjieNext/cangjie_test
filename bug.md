# testsuites/HLT/compiler/cjnative/Packages/org_name/backtick_in_package_name_2.cj

Message": "cannot using '`' in package name
should be use.

# testsuites/HLT/compiler/cjnative/Packages/org_name/invalid_colon_1.cj

+                               "Message": "expected a package name after '.' in qualified name, found ':'",

# cangjie_test/testsuites/HLT/compiler/cjnative/Packages/org_name/no_package_name_0.cj

+                               "Message": "expected a package name after '.' in qualified name, found '<EOF>'",

# testsuites/HLT/compiler/cjnative/Packages/org_name/single_import_2.cj

// ASSERT: scan expected a '*' or identifier after '::' in qualified name, found ':'

# cj定义泛型enum，config中没有任何关于泛型enum的config，就会ICE

预期应该不ICE，正常就不生成胶水层就好了
```
public enum CangjieGenericEnum<T> {
    | A(Int64, Bool)

    public func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int8, 
        Int16, Int32, Int64, UInt16, Float32, Float64) {
        Logger.println("CangjieGenericEnum.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
        Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
        (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    }
    // 泛型目前不支持静态成员函数
}

[[package]]
name = "UNNAMED"
APIStrategy = "Full"
GenericTypeStrategy = "Partial"

tuple_configuration = [
    "(Int, Bool)",
    "(Float32, Int32)",
    "(Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)",
]
lambda_patterns = [
#    { signature = "(Int64, Bool) -> Int64" },
#    { signature = "(Int32, Int32) -> Unit" },
    { signature = "(Int64, Bool) -> Int64" },
    { signature = "(Int32) -> Int32" },
]
generic_object_configuration = [
	{ name = "CangjieGenericClass", type_arguments = ["Int64"] },
	{ name = "CangjieGenericClass<Int64>", symbols = ["instanceMemberFunction"] },
	# { name = "CangjieGenericStruct", type_arguments = ["Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64"] },
	# { name = "CangjieGenericStruct<Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64>", symbols = ["instanceMemberFunction"] },
	# { name = "CangjieGenericEnum", type_arguments = ["Float64"] },
	# { name = "CangjieGenericEnum<Float64>", symbols = ["instanceMemberFunction"] },
]
```
# 当config中symbols没对上
这部分问题可以等到我把正确的写好了然后改错再探索。

泛型补充个MyToString就好了，里面需要包含所有interface的

# toml语法问题，漏逗号
```
tuple_configuration = [
    "(Int, Bool)",
    "(Float32, Int32)",
	"(Bool, Bool)"  # 漏逗号
    "(Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)",
	"((Bool, Bool), Int8, Int16, Int32, Int64, UInt16, Float32, Float64)",
]

```

# 嵌套tuple在toml中不允许
这个应该不是bug，是规格限制
# interface lambda 无default

```
public interface CangjieInterface {
    // func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int8, Int16, 
    //     Int32, Int64, UInt16, Float32, Float64) {
    //     Logger.println("CangjieStruct.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }
    // static func staticMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): (Bool, Int8, 
    //     Int16, Int32, Int64, UInt16, Float32, Float64) {
    //     Logger.println("CangjieStruct.staticMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }
    // func instanceMemberFunction(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64)): Unit {
    //     // Logger.println("CangjieStruct.instanceMemberFunction p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     // Logger.println("p[0] = ${p[0]}, p[1] = ${p[1]}")
    //     // (true, 8, 16, 32, 64, 16, 32.0, 64.0)
    // }

    func instanceMemberFunctionWithoutDefaultImpl(p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Int64): (Bool,
        Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> UInt16
    // static func staticMemberFunctionWithoutDefaultImpl(
    //     p: (Bool, Int8, Int16, Int32, Int64, UInt16, Float32, Float64) -> Float32): (Bool, Int8, Int16, Int32, Int64,
    //     UInt16, Float32, Float64) -> Float64
}

```