// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.reflect.*

public interface I {
    static func f123(): Int16
}

main(): Unit {
    TypeInfo.of<I>().getStaticFunction("f123").toString() |> println
}

/* SCAN
abstract static func f123(): Int16
*/
