// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.expect.out
// EXEC: %compiler %compile_exe_opt %n.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args 2>&1 > %n.real.out
// EXEC: %diff %n.expect.out %n.real.out
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public class S {
    public let left:Float32

    const public init(l:Float32) { left = l }
}

const a: Float32 = 20.0
const b = S(a)

main(): Int64 {
    println("${Float64(b.left)}")
    return 0
}
