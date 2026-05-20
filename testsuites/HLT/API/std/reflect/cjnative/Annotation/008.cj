/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %cmp_opt %compile_library --module-name=MyType ./MyType/src/myType/*.cj -o libMyType.myType.%library_suffix
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %cmp_opt -o %output %f -L. -lMyType.myType %cmp_utest_opt
// (!(target_mac | target_ios | target_ios_simulator)) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
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
