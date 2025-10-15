// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/// EXEC-PIPE: %frontendCompiler %cmp_opt %enableO2 %dump-ir-to-screen %f 2>&1| compare %f
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 
/// ASSERT: regex %\d+ = load atomic i8, i8 addrspace\(1\)\* %\d+ seq_cst, align 8

internal import std.sync.*

func test1(): Int8 {
    var atomicBool = AtomicInt8(12)
    var a1 = atomicBool.load()
    a1
}

main() {
    test1() - 12
}
