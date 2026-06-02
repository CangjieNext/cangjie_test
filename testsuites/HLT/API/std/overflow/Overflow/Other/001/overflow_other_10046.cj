/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 

var temp: Int8 = 1

func f1() {
    return temp + 99
}

func test(): Int8 {
    var x: Int8 = f1()
    var y: Int8 = f1()
    return x + y
}

main() {
    try {
        test()
    } catch (e: OverflowException) {
        return 0
    }
    return 1
}
