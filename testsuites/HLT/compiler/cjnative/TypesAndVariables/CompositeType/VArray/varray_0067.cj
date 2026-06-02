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
    var varr: VArray<String, $2> = ["test", "varray"]
    varr[0] = "test "
    var str = varr[0] + varr[1]
    if (str == "test varray") {
        return 0
    }
    return 1
}
// ASSERT: scan sema_varray_arg_type_with_reftype
