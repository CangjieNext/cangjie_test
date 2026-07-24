// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// An ordinary call invalidates tracked var values even when it takes no argument.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func observe() {}

main() {
    var value = 1
    observe()
    if (value < 0) {
        println("reachable after call boundary")
    }
}

/* SCAN
*/
