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
// 自定义注解可作用于构造函数。
import std.reflect.*
import MyType.myType.*

@Annotation
public class Annotation1 {
    public let i:Int64 = 2
    public const init() {}
}

public class Foo {
    @Annotation1
    public init() {}

    @Annotation1
    public init(p0: Int64, p1: Float32, p2: Rune) {}
}

@Test
class Test {
    @TestCase
    func test0(): Unit {
        @Expect(((TypeInfo.of<Foo>() as ClassTypeInfo).getOrThrow().getConstructor().findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().i, 2)
        @Expect(((TypeInfo.of<Foo>() as ClassTypeInfo).getOrThrow().getConstructor(TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Rune>()).findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().i, 2)
    }
}
