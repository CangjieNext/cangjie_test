/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I1<T> where T <: I2<T> {}

interface I2<T> where T <: A<T> {}

open class A<T> where T <: B<T> {}

class B<T> where T <: I1<T> {}

main() {
    return 0
}
// ASSERT: scan sema_multiple_class_upperbounds
