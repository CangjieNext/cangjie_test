/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (host_win) EXEC: if not exist %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType/libMyType.myType.%library_suffix %compiler %cmp_opt %compile_library --module-name=MyType ./MyType/src/myType/*.cj -o %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType/libMyType.myType.%library_suffix
// (!host_win) EXEC: [ ! -f %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType/libMyType.myType.%library_suffix ] && %compiler %cmp_opt %compile_library --module-name=MyType ./MyType/src/myType/*.cj -o %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType/libMyType.myType.%library_suffix || true
// EXEC: %compiler %cmp_opt -o %output %f -L %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType --import-path %cangjie_test/testsuites/HLT/API/std/reflect/cjnative/MyType -lMyType.myType %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
// 自定义注解可以作用于函数形参。
import std.reflect.*
import MyType.myType.*

@Annotation
public class Annotation1 {
    public let i:Int64 = 2
    public const init() {}
}

public class Foo {
    public func f(@Annotation1 p0: Int64, @Annotation1 p1: Rune): Unit {}
}

@Test
class Test {
    @TestCase
    func test0(): Unit {
        @Expect((TypeInfo.of<Foo>().getInstanceFunction("f", TypeInfo.of<Int64>(), TypeInfo.of<Rune>()).parameters[0].findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().i, 2)
        @Expect((TypeInfo.of<Foo>().getInstanceFunction("f", TypeInfo.of<Int64>(), TypeInfo.of<Rune>()).parameters[1].findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().i, 2)
    }
}
