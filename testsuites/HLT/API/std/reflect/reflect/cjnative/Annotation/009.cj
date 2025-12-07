/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (not MAC) EXEC: cd ./MyType && %compiler %cmp_opt --output-type=dylib --module-name=MyType ./src/myType/*.cj -o libMyType_myType.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt -o %output %f --import-path . -L ./MyType -lMyType_myType %cmp_utest_opt
// (not MAC) RUN-EXEC: %cp ./MyType/libMyType_myType.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args
// 自定义注解可作用于实例成员函数。
import std.reflect.*
import MyType.myType.*

@Annotation
public class Annotation1 {
    public let i:Int64 = 2
    public const init() {}
}

class Foo {
    @Annotation1
    public func a(): Int64 {
        return 0
    }

    @Annotation1
    public func b(i: Int64): Int64 {
        return i
    }

    @Annotation1
    public func c(i: Float16, j: Float32) : Float64{
        return 1.2
    }
}

@Test
class Test {
    @TestCase
    func test0(): Unit {
        @Expect((TypeInfo.of<Foo>().getInstanceFunction("a").findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().i, 2)
        @Expect((TypeInfo.of<Foo>().getInstanceFunction("b", TypeInfo.of<Int64>()).findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().i, 2)
        @Expect((TypeInfo.of<Foo>().getInstanceFunction("c", TypeInfo.of<Float16>(), TypeInfo.of<Float32>()).findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().i, 2)
    }
}
