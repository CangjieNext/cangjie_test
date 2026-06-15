// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: mut wrapper generation must preserve method-level generic
// parameters when struct and class types are passed as default-method
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

struct StructArg {}
class ClassArg {}

struct StructImpl <: I {}
class ClassImpl <: I {}

main(): Int64 {
    var s = StructImpl()
    var c = ClassImpl()
    let structParam = s.accept<StructArg>(StructArg(), 1)
    let classParam = c.accept<ClassArg>(ClassArg(), 2)
    if (structParam == 1 && classParam == 2) {
        println("nominal params: ok")
    }
    return 0
}

/* SCAN
nominal params: ok
*/
