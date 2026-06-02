/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: A.cj
// ERRCHECK: %compiler %cmp_opt %f A.cj -o %output
// ASSERT: scan sema_interface_member_must_be_implemented

extend String <: I2 {}

extend String <: I1 {}

main(): Int64 {
    var res = "aaa".foo()
    if (res != 1) {
        return 1
    }
    0
}
