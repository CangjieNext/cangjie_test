// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 88.000000

class d {
    static let f: Float32 = 56.0
}

main(): Unit {
    println((d.f, (Float32(88.0), Float32(121.0))[0])[1])
}
