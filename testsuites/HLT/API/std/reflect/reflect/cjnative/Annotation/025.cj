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
// 注解带来的元数据不会被继承，但可以利用反射来获取父类的注解信息。
import std.reflect.*
import MyType.myType.*

@Annotation
public class MyAnnotation {
    public let id: Int64
    public const init() {
        this.id = 100
    }
}

@Annotation
public class MyAnnotation2 {
    public let data: String
    public const init() {
        this.data = ""
    }
}

@MyAnnotation
public open class Foo {}

@MyAnnotation2
public class Bar <: Foo {
    public func bar(): Int64 {
        (TypeInfo
            .of(this)
            .superClass
            .getOrThrow()
            .findAnnotation<MyAnnotation>()
            .getOrThrow() as MyAnnotation)
            .getOrThrow()
            .id
    }
}

@Test
class Test {
    @TestCase
    func test0(): Unit {
        @Expect(Bar().bar(), 100)
    }
}
