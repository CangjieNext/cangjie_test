/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f -o %output
// (not MAC) RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1

import std.reflect.*

class C2<T> {}

main(): Unit {
    // 先创建一个该泛型实例，然后就能找到了。
    let _ = C2<Int64>()
    TypeInfo.get("default.C2<Int64>")
}
