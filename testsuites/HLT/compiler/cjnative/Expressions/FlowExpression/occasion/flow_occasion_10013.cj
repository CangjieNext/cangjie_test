/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func a(input: Bool): Bool {
    input
}

extend Bool {
    public operator func ()(input_b: Bool): Bool {
        input
    }
}

main(): Int64 {
    (true |> a) || (true |> a)
    (true ~> true) || (true ~> true)
    return 0
}
// ASSERT: scan sema_undeclared_identifier
// ASSERT: scan sema_invalid_binary_expr
