// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f %int_overflow_opt=wrapping -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 0

main() {
    let v: UInt8 = 255
    let v8: UInt8 = v + 1
    println(v8)
}
