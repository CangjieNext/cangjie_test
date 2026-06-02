// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var a: Float32 = 102.0

func c(co!: Float32, cp!: Range<Int64> = 9..161): Int64 {
    c(co: try {
        let cq = UInt8(0)
        a
    } catch (d: Exception) {
        a
    })
    0
}

main() {
    0
}
