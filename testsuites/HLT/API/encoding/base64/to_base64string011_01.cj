/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.encoding.base64.*

var temp: UInt8 = 1

func f1() {
    return temp + 254
}

main(): Int64 {
    var a: UInt8 = f1()
    try {
        var res1 = toBase64String([a + 1u8])
    } catch (_: OverflowException) {
        return 0
    }
    return 1
}
