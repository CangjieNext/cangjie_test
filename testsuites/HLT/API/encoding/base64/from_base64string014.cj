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

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case None => default
    }
    return result
}

main(): Int64 {
    var opt1 = fromBase64String("TW=")
    var opt2 = fromBase64String("UaTW3")
    var res1 = matchResult<Array<UInt8>>(opt1, [1u8])
    var res2 = matchResult<Array<UInt8>>(opt2, [1u8])
    if (res1.size == 1 && res2.size == 1 && res1[0] == 1 && res1[0] == 1) {
        return 0
    }
    return 1
}
