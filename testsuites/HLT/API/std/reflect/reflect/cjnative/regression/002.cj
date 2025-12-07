/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// 动态加载场景下构造class类型实例并获取其实例成员变量的值。
// 这个bug本质上也是interface的bug。

import std.reflect.*

main(): Unit {
    let m = ModuleInfo.load("./libtest_a")
    let p = m.getPackageInfo("a")
    let a = (p.getTypeInfo("test/a.A") as ClassTypeInfo).getOrThrow().construct()
    ((p
        .getTypeInfo("test/a.A") as ClassTypeInfo)
        .getOrThrow()
        .getInstanceVariable("v")
        .getValue(a) as Int64)
        .getOrThrow() |> println
}
