/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %n.%suffix %run_args

/*
 * Test description: Test the funcs for json_exception.cj
 * Test API: public open class JsonException <: Exception {
 *             public init()
 *           }
 */

import stdx.encoding.json.*

main() {
    var a = JsonException()
    if (a.toString() != "JsonException") {
        return -1
    }
    return 0
}
