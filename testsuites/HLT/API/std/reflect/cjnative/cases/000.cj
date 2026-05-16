/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %cmp_opt %f -o %output
// (!(target_mac | target_ios | target_ios_simulator)) RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 

import std.reflect.*

class C2<T> {}

main(): Unit {
    TypeInfo.get("default.C2<Int64>")
}
