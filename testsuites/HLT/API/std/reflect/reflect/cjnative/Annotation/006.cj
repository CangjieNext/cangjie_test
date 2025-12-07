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
// 在注解类中可以定义实例成员变量。
import std.reflect.*
import MyType.myType.*

@Annotation
public class Annotation1 {
    public let a: Int64 = 5
    public let b: Float64 = 6.0
    public let c: String = "S"
    public let d: Rune = r'C'
    public const init() {}
}

@Annotation1
public class Foo {}

@Test
class Test {
    @TestCase
    func test0(): Unit {
        @Expect((TypeInfo.of<Foo>().findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().a, 5)
        @Expect((TypeInfo.of<Foo>().findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().b, 6.0)
        @Expect((TypeInfo.of<Foo>().findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().c, "S")
        @Expect((TypeInfo.of<Foo>().findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().d, r'C')
    }
}
