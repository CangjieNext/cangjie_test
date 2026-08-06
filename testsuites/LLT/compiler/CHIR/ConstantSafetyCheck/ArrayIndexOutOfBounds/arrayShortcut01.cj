// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-3 "DiagKind": "chir_idx_out_of_bounds"

public func arrayShortcut01() {
    var a = 2
    var b: Array<Int32> = [0]
    if (true || if (true) {a = 1; true} else {true}) {
        b[a]
    }
    b[a]
}

public func arrayShortcut02() {
    var a = 2
    var b: Array<Int32> = [0]
    if (false && if (true) {a = 1; true} else {true}) {
        b[a]
    }
    b[a]
}

main() {
    arrayShortcut01()
    arrayShortcut02()
    0
}




// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
