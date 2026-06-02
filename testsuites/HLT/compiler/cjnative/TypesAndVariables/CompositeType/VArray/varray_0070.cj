/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test1() {
    1
}

func test2() {
    -1
}

main(): Int64 {
    var varr: VArray<() -> Int64, $2> = [test1, test1]
    varr[1] = test2
    return varr[0]() + varr[1]()
}
// ASSERT: scan sema_varray_arg_type_with_reftype
