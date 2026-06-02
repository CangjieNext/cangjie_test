// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %enableO2 %f -o %output 2>&1 | compare %f

func cond() {
    var temp = true
    return temp
}

func test() {
    var temp1 = 1
    if (cond()) {
        temp1 = 0
    } else {
        temp1 = 1
    }
    var a = temp1 / temp1
    return a
}

main() {
    test()
    1
}

// ASSERT: scan divide by zero
