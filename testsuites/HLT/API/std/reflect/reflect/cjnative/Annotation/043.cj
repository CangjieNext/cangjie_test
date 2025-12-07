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
