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
// 当形参类型为interface时。
import std.reflect.*

public interface I0 {}

public class C0 <: I0 {}

public class C1 {
    public func f(p0: I0): Int64 {
        12
    }
}

main(): Unit {
    (TypeInfo.of<C1>().getInstanceFunction("f", TypeInfo.of<I0>()).apply(C1(), C0()) as Int64).getOrThrow() |> println
}
