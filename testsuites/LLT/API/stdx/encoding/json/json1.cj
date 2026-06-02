/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f
// EXEC:%set_stdx_path %run %run_opt %output %run_args

import stdx.encoding.json.*
import stdx.serialization.serialization.*

func serialize<T>(obj: Array<T>): String where T <: Serializable<T> {
    return obj.serialize().toJson().toString()
}

main() {
    print(serialize(Array<String>()))
    print(serialize(Array<Int64>()))
    0
}
