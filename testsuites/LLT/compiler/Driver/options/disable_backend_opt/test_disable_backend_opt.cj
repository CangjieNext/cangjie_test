// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  (DEBUG_OPTION)EXEC-PIPE: %compiler %enableO2 %disableBackendOpt %f -V -o %output 2>&1 | compare %f
//  ASSERT: regex-not opt" .*-O2.*
//  ASSERT: regex-not llc" .*-O2.*

func foo(b: Bool) {
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
