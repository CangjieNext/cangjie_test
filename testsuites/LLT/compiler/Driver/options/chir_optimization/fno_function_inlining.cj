// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt -O2 --fno-chir-function-inlining %f -o %output 2>&1 | compare %f
//  ASSERT: scan-not was optimized by The opt: Function Inline

func foo(b: Bool) {
    var x = true
    if (b) {
        x = true
    }
    return x
}

main() {
    var res = foo(false)
    if (res) {
        0
    } else {
        1
    }
}
