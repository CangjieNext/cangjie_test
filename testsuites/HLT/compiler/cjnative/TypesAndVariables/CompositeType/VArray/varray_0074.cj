/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

enum AA {
    A1 | A2
}

main(): Int64 {
    var varr: VArray<AA, $2> = [A1, A2]
    if (varr[0] is AA && varr[1] is AA) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_varray_arg_type_with_reftype
