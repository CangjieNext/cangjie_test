/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test<T1, T2, T3>(f: (T1) -> T2): (T3) -> Int64 {
    {a: T3 => 1}
}

main() {
    1 |> test({i => i})
    return 0
}
// ASSERT: scan sema_lambdaExpr_must_have_type_annotation
