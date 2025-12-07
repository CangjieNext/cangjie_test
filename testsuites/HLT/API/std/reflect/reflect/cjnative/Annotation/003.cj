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
// 在注解类中可以成功定义实例成员变量。

import std.reflect.*
import MyType.myType.*

@Annotation
public class Annotation1 {
    public let a0: Int64
    public let a1: String
    public const init(a0: Int64, a1: String) {
        this.a0 = a0
        this.a1 = a1
    }
    public const init(a0: Int64) {
        this.a0 = a0
        this.a1 = "kiki"
    }
    public const init() {
        this.a0 = 12
        this.a1 = "do you love me"
    }
}

public open class Bar {
    public func bar(): String {
        (TypeInfo.of(this).findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().a1
    }
}

@Annotation1
public class Foo <: Bar {}

@Annotation1[5]
public class Foo5 <: Bar {}

@Annotation1[102, "hello world"]
public class Foo102 <: Bar {}

@Test
class Test {
    @TestCase
    func test0(): Unit {
        @Expect(Foo().bar(), "do you love me")
        @Expect(Foo5().bar(), "kiki")
        @Expect(Foo102().bar(), "hello world")
    }
}
