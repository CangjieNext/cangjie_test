// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.reflect.*

public interface I1 {
    mut prop p: Int8
}

public interface I2 {
    mut static prop p: Int64
}

main(): Unit {
    TypeInfo.of<I1>().getInstanceProperty("p").toString() |> println
    TypeInfo.of<I2>().getStaticProperty("p").toString() |> println
}

/* SCAN
open abstract mut prop p: Int8
abstract static mut prop p: Int64
*/
