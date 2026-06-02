// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %disableConstPropagation %f -o %output 2>&1 | compare %f
// only check cjc compile error

func foo(): Int64 {
    return 1 << 1
}

main() {
    let x = foo()
    var i = 3
    if (x > 2) {
        i = 4
    } else {
        i = 3
    }
    var e: VArray<VArray<Int64, $3>, $3> = [[1, 2, 3], [1, 2, 3], [1, 2, 3]]
    e[i] = [3, 2, 1]
}

// ASSERT: scan error: array index is out of bounds
