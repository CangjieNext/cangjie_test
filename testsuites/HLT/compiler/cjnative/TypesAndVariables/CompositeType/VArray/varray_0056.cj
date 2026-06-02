/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test<T>(a: T) where T <: VArray<Int64, $3> {
    a
}

main(): Int64 {
    return test<VArray<Int64, $3>>([1, 2, 3])[0] - 1
}

// ASSERT: scan sema_upper_bound_must_be_class_or_interface
