/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output
// (not MAC) RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.reflect.*

public open class C0 {}

public class C1 <: C0 {}

public class C2 {
    public func f(p0: C0): Int64 {
        12
    }
}

main(): Unit {
    (TypeInfo.of<C2>().getInstanceFunction("f", TypeInfo.of<C0>()).apply(C2(), C1()) as Int64).getOrThrow() |> println
}
