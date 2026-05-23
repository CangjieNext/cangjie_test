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
// 拥有泛型的注解类，类型实例化后不一样的话则可以重复使用。
import std.reflect.*
import MyType.myType.*

@Annotation
public class A0<T> {
    let v: T
    public const init(p0: T) {
        this.v = p0
    }
}

@A0[12]
@A0[r'a']
public class C0 {}

main(): Unit {
    (TypeInfo.of<C0>().findAnnotation<A0<Rune>>().getOrThrow() as A0<Rune>).getOrThrow().v |> println
    (TypeInfo.of<C0>().findAnnotation<A0<Int64>>().getOrThrow() as A0<Int64>).getOrThrow().v |> println
}
