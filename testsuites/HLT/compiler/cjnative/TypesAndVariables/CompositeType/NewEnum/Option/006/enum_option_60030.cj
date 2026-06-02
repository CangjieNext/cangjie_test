/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class C {
    public var d: Int64 = 1
}

func test(): Option<Int64> {
    var c: ?C = C()
    var x: ??Int64 = c?.d
    return Some(0)
}

main(): Int64 {
    return test() ?? 1
}
