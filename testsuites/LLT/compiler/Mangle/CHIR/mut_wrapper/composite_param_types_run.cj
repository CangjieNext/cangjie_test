// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: mut wrapper generation must preserve method-level generic
// parameters when array, tuple, and function types are passed as default-method
// parameter types.

// EXEC: %compiler %cmp_opt %compile_exe_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

interface I {
    mut func accept<T>(value: T, tag: Int64): Int64 {
        let typed: T = value
        consume(typed)
        tag
    }
}

func consume<T>(_: T): Unit {}

func inc(value: Int64): Int64 {
    value + 1
}

struct StructArg {}
class ClassArg {}

struct C <: I {}

main(): Int64 {
    var c = C()
    let arrayParam = c.accept<Array<Int64>>([1, 2, 3], 1)
    let tupleParam = c.accept<(StructArg, ClassArg, (Int64) -> Int64)>(
        (StructArg(), ClassArg(), inc), 2)
    let funcParam = c.accept<(Int64) -> Int64>(inc, 3)
    if (arrayParam == 1 && tupleParam == 2 && funcParam == 3) {
        println("composite params: ok")
    }
    return 0
}

/* SCAN
composite params: ok
*/
