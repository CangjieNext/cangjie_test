/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface I<T> {}

public open class A<T> {}

public class B<T> <: A<T> & I<T> & I<Int32> {}

main() {
    var a: B<Int32> = B<Int32>()
    return 0
}
// ASSERT: scan sema_inherit_duplicate_interface
