/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test(varr: VArray<Float64, $3>): VArray<Int64, $3> {
    varr
}

main(): Int64 {
    return test([1.0, 2.0, 3.0])[0] - 1
}
// ASSERT: scan sema_mismatched_types
