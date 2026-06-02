/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output
// EXEC:%set_stdx_path %run %run_opt %output %run_args

/*
 * Test description:
 *      test null character
 */

import stdx.encoding.json.*

main(): Int64 {
    let str01 = "\"\\u0000\""
    let expect1 = "\0"
    let expect2 = "\"\\u0000\""
    let jv: JsonValue = JsonValue.fromStr(str01)
    if (expect1 != jv.asString().getValue()) {
        return 1
    }
    if (expect2 != jv.toString()) {
        return 2
    }

    return 0
}
