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

import stdx.encoding.hex.*

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(x) => x
        case None => default
    }
    return result
}

main(): Int64 {
    var opt1 = fromHexString("TW=U")
    var opt2 = fromHexString("=TWU")
    var opt3 = fromHexString("=TW=")
    var opt4 = fromHexString("=T==")
    var opt5 = fromHexString("T===")
    var res1 = matchResult<Array<UInt8>>(opt1, Array<UInt8>())
    var res2 = matchResult<Array<UInt8>>(opt2, Array<UInt8>())
    var res3 = matchResult<Array<UInt8>>(opt3, Array<UInt8>())
    var res4 = matchResult<Array<UInt8>>(opt4, Array<UInt8>())
    var res5 = matchResult<Array<UInt8>>(opt5, Array<UInt8>())
    if (res1.size == 0 && res2.size == 0 && res3.size == 0 && res4.size == 0 && res4.size == 0) {
        return 0
    }
    return 1
}
