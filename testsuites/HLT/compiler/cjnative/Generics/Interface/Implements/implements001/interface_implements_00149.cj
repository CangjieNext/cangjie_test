/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I<T> {}

class A<T> {}

open class B<T> <: A<T> & I<T> {}

main() {
    var a: B<Int32>
    return 0
}
// ASSERT: scan sema_non_inheritable_super_class
