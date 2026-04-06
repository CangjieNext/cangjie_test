/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not iOS) EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-EXEC: %run %run_opt %output %run_args

//AR-SR-Lang-1014-27 overflow for IntNative

var temp: IntNative = -1

func f1() {
    return temp - 9223372036854775807
}

main(): IntNative {
    try {
        var i1: IntNative = f1()
        var i: Int32 = Int32(i1 - 1)
    } catch (e: OverflowException) {
        return 0
    }
    return 1
}
