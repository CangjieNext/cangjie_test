/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
class A {
    var b = Some((1, 1))
}

main() {
    var a = Some(A())
    a?.b?[0] = 1
    var res1 = a?.b?[0] ?? -1
    return 0
}
// ASSERT: scan sema_unqualified_left_value_assigned
