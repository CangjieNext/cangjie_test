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
public class BaseAnno {
    public let a:Int64 = 100
    public const init() {}
}

@Annotation
public class InterfaceAnno {
    public let b:Int64 = 200
    public const init() {}
}

@Annotation
public class SubAnno {
    public let c:Int64 = 300
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
        @Expect((TypeInfo.of<Sub>().findAnnotation<SubAnno>().getOrThrow() as SubAnno).getOrThrow().c, 300)

        @Expect(TypeInfo.of<Base>().annotations.size, 1)
        @Expect((TypeInfo.of<Base>().findAnnotation<BaseAnno>().getOrThrow() as BaseAnno).getOrThrow().a, 100)
    }
}
