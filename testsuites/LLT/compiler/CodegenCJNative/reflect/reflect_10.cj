// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan vs.size = 1
// ASSERT: scan vs[0].ti = default.ZeroS

import std.reflect.*

public struct ZeroS {
    public init() {}
}

public enum EZ {
    | C1(ZeroS)
}

main() {
    let ez = EnumTypeInfo.get("default.EZ")
    let v = EZ.C1(ZeroS()) // 按声明语法构造一个真实的 EZ.C1(ZeroS())，再反射拆开数参数

    let (ctor, vs) = ez.destruct(v)
    let ti = TypeInfo.of(vs[0])
    println("vs.size = ${vs.size}") // Expect 1
    println("vs[0].ti = ${ti}")
}
