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

import std.reflect.*
import MyType.myType.*

@Annotation
public class Annotation1 {
    public let data: String
    public const init() {
        this.data = "empty"
    }
    public const init(data: String) {
        this.data = data
    }
}

@Annotation1
public class Foo {}

@Annotation1["name_bar"]
public class Bar {}

@Test
class Test {
    @TestCase
    func test0(): Unit {
        var obj = Foo()
        @Expect(TypeInfo.of(obj).annotations.size, 1)
        @Expect((TypeInfo.of(obj).findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().data, "empty")
    }
    @TestCase
    func test1(): Unit {
        var obj2 = Bar()
        @Expect(TypeInfo.of(obj2).annotations.size, 1)
        @Expect((TypeInfo.of(obj2).findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().data, "name_bar")
    }
}
