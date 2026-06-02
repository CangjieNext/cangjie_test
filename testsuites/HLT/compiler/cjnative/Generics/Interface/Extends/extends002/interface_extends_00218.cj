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
interface A1<T> {}

interface A2<T> {}

interface A3<T> {}

interface B<X, Y, Z> <: A1<X> & A2<Y> & A3<Z> {}

main() {
    return 0
}
