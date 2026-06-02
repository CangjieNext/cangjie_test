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

//Brief:限制T <: Serializable<T>，实例化为基础类型，Int64
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
