/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_extend_member_cannot_shadow

class A<T> {}

extend A<Int64> {
    func f1() {}
}

extend A<String> {
    func f1() {}
}

main(): Int64 {
    0
}
