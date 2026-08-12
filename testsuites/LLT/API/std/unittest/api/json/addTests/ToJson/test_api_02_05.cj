/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler    %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan pass


package std.unittest.test

import std.unittest.common.*

main() {
    var jv: JsonValue = JsonInt(12)
    if (DataModel.fromJson(jv) is DataModelInt) {
        print("pass")
    } else {
        print("fail")
    }
    0
}
