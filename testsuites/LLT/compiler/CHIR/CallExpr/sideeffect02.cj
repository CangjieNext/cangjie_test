// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 
// EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f 
// ASSERT: scan 1

var count = 0

main() {
    let a: Array<UInt8> = [1, 2]
    func test() {
        count++
        a
    }
    test()[0] += 3 // [](test(),0, [](test(),0) + 3)
    println(count)
    return 0
}

