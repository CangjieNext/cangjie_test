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
// 注解带来的元数据不会被继承。

import std.reflect.*

@Annotation
public class BaseAnno {
    public const init() {}
}

@Annotation
public class InterfaceAnno {
    public const init() {}
}

@Annotation
public class SubAnno {
    public const init() {}
}

@BaseAnno
public open class Base {}

@InterfaceAnno
public interface I {}

@SubAnno
public class Sub <: Base & I {} // Sub has only SubAnno annotation information.

@Test
class Test {
    @TestCase
    func test0(): Unit {
        @Expect(TypeInfo.of<Sub>().annotations.size, 1)
        @Expect(TypeInfo.of<Sub>().findAnnotation<InterfaceAnno>().isNone())
        @Expect(TypeInfo.of<Sub>().findAnnotation<BaseAnno>().isNone())
        @Expect(TypeInfo.of<Sub>().findAnnotation<SubAnno>().isSome())
    }
}
