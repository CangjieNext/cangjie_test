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
// (not MAC) RUN-EXEC: %cp ./MyType/libMyType_myType.%test_suffix .&& %run %run_opt %output %run_args
// Check that it is possible to declare an annotation with a target type
// 通过宏 @Annotation 的 target 形参可以控制该注解可以作用于哪些代码结构。
import std.reflect.*
import MyType.myType.*

@Annotation[target: [Type]]
public class CustomAnnotation {
    public let id: Int64
    public const init() {
        id = 444
    }
}

@CustomAnnotation
public class Foo {}

@Test
class Test {
    @TestCase
    func test0(): Unit {
        @Expect((TypeInfo.of<Foo>().findAnnotation<CustomAnnotation>().getOrThrow() as CustomAnnotation).getOrThrow().id, 444)
    }
}
