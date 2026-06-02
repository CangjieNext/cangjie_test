// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %enableO2 %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: scan array index is out of bounds

var a = 0 is UInt8
var b = 0

main() {
    try {
        var c: Array<Option<Int64>> = []
        let d: Option<Int64> = None
        if (a) {
            c
        } else {
            [0, d, Option<Int64>.None, 0, Option<Int64>.None, b]
        }[4] ?? try {
            [b]
        } finally {}[7]
        print(0)
    } catch (e: NoneValueException) {
        print(1)
    }
}
