/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class C {
    var item: Int64 = 100
}

let c = C()
let c1 = Option<C>.Some(c)
let r1: Int32 = c1?.item

main() {
    return 1
}
// ASSERT: scan sema_mismatched_types
