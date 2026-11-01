/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
// 自定义注解样例。
import std.reflect.*

@Annotation
public class CustomAnnotation {
    public let name: String
    public let version: Int64
    public const init(name: String, version!: Int64 = 0) {
        this.name = name
        this.version = version
    }
}

// use annotation
@CustomAnnotation["Sample", version: 1]
public class Foo {}

@Test
class Test {
    @TestCase
    func test0(): Unit {
        @Expect((TypeInfo.of<Foo>().findAnnotation<CustomAnnotation>().getOrThrow() as CustomAnnotation).getOrThrow().name, "Sample")
        @Expect((TypeInfo.of<Foo>().findAnnotation<CustomAnnotation>().getOrThrow() as CustomAnnotation).getOrThrow().version, 1)
    }
}
