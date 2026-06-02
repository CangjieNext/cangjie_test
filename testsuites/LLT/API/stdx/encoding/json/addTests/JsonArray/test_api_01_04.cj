/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: creat_data.cj
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %stdx-package  creat_data.cj -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan error

import stdx.encoding.json.*

main(): Int64 {
    var initFunc = JsonArray()
    var caseClass = TestJsonArray()
    caseClass.testAdd(creatJsonValue(-1, 1, "hello"), initFunc)
    var itemm = initFunc.getItems()
    for (i in 0..itemm.size) {
        try {
            //getItem 不存在的项
            var result = itemm[2]
        } catch (e: Exception) {
            print("error")
        }
    }
    return 1
}
