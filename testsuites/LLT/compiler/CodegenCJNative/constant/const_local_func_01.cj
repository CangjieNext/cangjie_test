// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan 0
// ASSERT: scan 1

main(){
    const func func1(): Int64 {
        0
    }
    println(func1())
    if (true) {
        const func func1(): Int64 {
            1
        }
        println(func1())
    }
    return 0
}