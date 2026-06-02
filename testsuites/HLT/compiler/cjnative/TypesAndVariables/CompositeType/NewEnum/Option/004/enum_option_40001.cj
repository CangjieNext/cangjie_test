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
    public var item: Int64 = 100
}

main(): Int64 {
    let c = C()
    let c1 = Option<C>.Some(c)
    let r1 = c1?.item // r1 = Option<Int64>.Some(100)
    let res = r1 ?? 0
    return res - 100
}
