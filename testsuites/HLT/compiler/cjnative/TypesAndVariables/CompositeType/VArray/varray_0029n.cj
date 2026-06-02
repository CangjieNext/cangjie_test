/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test(varr: VArray<Int64, $3>) {
    varr = [0, 0, 0]
    varr[0]
}

main(): Int64 {
    return test([1, 2, 3])
}
// ASSERT: scan sema_cannot_assign_to_immutable
