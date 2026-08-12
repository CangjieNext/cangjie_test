/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: creat_data.cj
// EXEC: %compiler    %cmp_opt   creat_data.cj -o %n.%suffix %f
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan error

package std.unittest.test

import std.unittest.common.*

main(): Int64 {
    var initFunc = JsonArray()
    var caseClass = TestJsonArray()
    var jsonValue = creatJsonValue(-1, 1, "hello")
    caseClass.testAdd(jsonValue, initFunc)
    // get 不存在的 index
    if (initFunc.size() == 1) {
        try {
            var result = initFunc.get(1).getOrThrow()
        } catch (e: Exception) {
            print("error")
        }
    }
    return 1
}
