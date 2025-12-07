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
// 在注解类中可以定义实例成员函数。
import std.reflect.*
import MyType.myType.*

@Annotation
public class Annotation1 {
    public func bar(i: Int16): Int16 {
        return i - 10
    }
    public const init() {}
}

@Annotation1
class Foo {}

@Test
class Test {
    @TestCase
    func test0(): Unit {
        var obj = Foo()
        @Expect((TypeInfo.of(obj).findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().bar(10), 0)
        @Expect((TypeInfo.of(obj).findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().bar(11), 1)
        @Expect((TypeInfo.of(obj).findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().bar(102), 92)
    }
}
