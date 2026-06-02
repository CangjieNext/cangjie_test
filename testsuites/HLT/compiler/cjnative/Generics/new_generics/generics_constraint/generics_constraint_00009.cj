/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_upper_bound_must_be_class_or_interface
// ASSERT: scan sema_generic_param_exist_in_class_irrelevant_upperbound_recursively

class A<M> where M <: VArray<Int64, $1> {}

class B<M> where M <: VArray<M, $1> {}

main() {
    return 0
}
