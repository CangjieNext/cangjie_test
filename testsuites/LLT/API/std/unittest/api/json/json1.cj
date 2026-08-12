/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler    %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %output %run_args

package std.unittest.test

import std.unittest.common.*


func serialize<T>(obj: Array<T>): String where T <: Serializable<T> {
    return obj.serializeInternal().toJson().toString()
}

main() {
    print(serialize(Array<String>()))
    print(serialize(Array<Int64>()))
    0
}
