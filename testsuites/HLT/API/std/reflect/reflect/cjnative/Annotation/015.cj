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
// 一个被 @Annotation 修饰的 class 类型必须至少提供一个 const init 构造函数，否则编译器报错。
import std.reflect.*
import MyType.myType.*

@Annotation
public class Annotation1 {
    public let id: Int64
    public const init() {
        this.id = 0
    }
    public const init(id: Int64) {
        this.id = id
    }
}

@Annotation1[56]
public class Foo {}

@Test
class Test {
    @TestCase
    func test0(): Unit {
        @Expect((TypeInfo.of<Foo>().findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().id, 56)
    }
}
