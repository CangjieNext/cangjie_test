// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt -O2 %f --fno-chir-constant-propagation -o %output 2>&1 | compare %f
//  ASSERT: scan-not was optimized by The opt: Constant Folding
//  ASSERT: scan-not optimized by The opt: Constant Propagation

func foo(b: Bool) {
    var z = 1 + 2; // can be folded
    var x = true
    if (b) {
        x = true
    }
    return x // can be propagated
}

main() {
    var res = foo(false)
    if (res) {
        0
    } else {
        1
    }
}
