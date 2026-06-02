/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    var v: VArray<Int64, $2> = [1, 2]
    var varr: VArray<Option<VArray<Int64, $2>>, $2> = [Some(v), Option<VArray<Int64, $2>>.None]
    return (varr[0] ?? [1, 2, 3])[0] - 1
}
// ASSERT: scan sema_varray_arg_type_with_reftype
// ASSERT: scan sema_varray_size_match
