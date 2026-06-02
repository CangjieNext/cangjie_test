/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// 由于注解注解类自身的构造器导致的递归init调用。
// 单个注解类内部的单个构造函数对自己的循环依赖。
// 禁止构造函数之间循环依赖，否则编译报错。
import std.reflect.*
import MyType.myType.*

@Annotation
@A0[12]
public class A0<T> {
    @A0[12]
    let v: T
    // @A0['a']
    public const init(
        // @A0[13]
        p0: T) {
        this.v = p0
    }
    @A0[12]
    public func f(@A0['a'] p0: T): Unit {
    }
}

// @A0[12]
@A0['a']
public class C0 {
    public prop p: Int64 {
        get() {
            12
        }
    }
}

main(): Unit {
    (TypeInfo.of<C0>().findAnnotation<default.A0<Rune>>().getOrThrow() as A0<Rune>).getOrThrow().v |> println
}
