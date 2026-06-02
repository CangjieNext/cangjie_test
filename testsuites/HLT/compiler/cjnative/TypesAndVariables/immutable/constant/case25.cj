/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_object_cannot_access_static_member

class C1 {
    static const test: Int64 = 1
    static const lambda1 = {i: Int64 => 1 - i}(1)
}

main(): Int64 {
    var temp = C1()
    return temp.test + temp.lambda1 - 1
}
