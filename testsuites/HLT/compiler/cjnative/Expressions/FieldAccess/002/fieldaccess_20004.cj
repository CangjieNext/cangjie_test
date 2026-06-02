/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func a(x: Int64) {
    x
}

extend (Int64) -> Int64 {
    func test() {
        0
    }
}

main() {
    (a ~> a).test()
}
// ASSERT: scan sema_illegal_extended_type
// ASSERT: scan sema_undeclared_identifier
