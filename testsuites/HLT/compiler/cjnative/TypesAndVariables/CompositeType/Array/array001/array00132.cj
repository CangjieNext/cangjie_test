/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
func func0(): Unit {
    return
}

func func1(): Unit {
    return
}

func func2(input: Int32): Int32 {
    return input
}

main(): Int64 {
    let myArray0: Array<(() -> Unit)> = [func1]
    let myArray1: Array<(() -> Unit)> = [{=> ()}]
    let myArray2: Array<((Int32) -> Int32)> = [func2, func2]
    return 0
}
