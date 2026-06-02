/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class C {
    public var item: Int64 = 100
}

main(): Int64 {
    let c1: ?C = C()
    let r1 = c1?.item<Bool>
    let res = r1 ?? 0
    return res - 100
}
// ASSERT: scan sema_generic_argument_no_match
