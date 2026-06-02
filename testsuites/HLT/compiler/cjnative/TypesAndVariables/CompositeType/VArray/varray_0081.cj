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
    var varr: VArray<Array<Int64>, $2> = [[1, 2, 3], [-1, -2, -3]]
    varr[0][0] = 0
    return varr[0][0] + varr[0][1] + varr[0][2] + varr[1][0] + varr[1][1] + varr[1][2] + 1
}
// ASSERT: scan sema_varray_arg_type_with_reftype
