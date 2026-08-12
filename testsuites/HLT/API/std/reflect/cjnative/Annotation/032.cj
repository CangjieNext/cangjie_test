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
import std.reflect.*
import MyType.myType.*

@Annotation
public class IHello {
    public let greeting: String
    public let name: String

    public const init(greeting: String, name: String) {
        this.greeting = greeting
        this.name = name
    }

    public func hi(): String {
        this.greeting + ", " + this.name
    }
}

@Annotation
public class Version {
    public let version: String
    public const init() {
        this.version = "Default"
    }
}

const arg1 = "Hi"
const arg2 = "Anon"

@IHello[arg1, arg2]
@Version
public class Foo {}

@Test
class Test {
    @TestCase
    func test0(): Unit {
        @Expect((TypeInfo.of<Foo>().findAnnotation<IHello>().getOrThrow() as IHello).getOrThrow().greeting, "Hi")
        @Expect((TypeInfo.of<Foo>().findAnnotation<IHello>().getOrThrow() as IHello).getOrThrow().name, "Anon")
        @Expect((TypeInfo.of<Foo>().findAnnotation<Version>().getOrThrow() as Version).getOrThrow().version, "Default")
        @Expect((TypeInfo.of<Foo>().findAnnotation<IHello>().getOrThrow() as IHello).getOrThrow().hi(), "Hi, Anon")
    }
}
