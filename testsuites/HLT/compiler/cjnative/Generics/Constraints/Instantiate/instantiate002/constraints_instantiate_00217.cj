/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface A<T> {}

interface B<T> where T <: A<T> {}

class C<T> <: A<T> & B<T> where T <: A<T> {}

class D <: A<D> {}

main() {
    C<D>()
    return 0
}
