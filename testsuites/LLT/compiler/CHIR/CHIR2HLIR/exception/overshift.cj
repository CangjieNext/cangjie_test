// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %n.cj -Woff unused %diag_json -o %output

main(): Int64 {
    var a: Int32 = 8
    var b: Int32 = 0
    var r: Int32 = 33
    b = a << r
    b = a >> r
    return 1
}
// ASSERT: scan chir_shift_length_overflow
