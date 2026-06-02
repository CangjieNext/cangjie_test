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

const test: Int64 = 1
const a = 1

class I1 {
    static const lambda1 = {i: Int64 => test - i}(a)
}

main(): Int64 {
    var temp = I1()
    return temp.lambda1
}
