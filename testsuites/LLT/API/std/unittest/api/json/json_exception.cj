/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler    %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args

/*
 * Test description: Test the funcs for json_exception.cj
 * Test API: public open class JsonException <: Exception {
 *             public init()
 *           }
 */

package std.unittest.test

import std.unittest.common.*

main() {
    var a = JsonException()
    if (a.toString() != "JsonException") {
        return -1
    }
    return 0
}
