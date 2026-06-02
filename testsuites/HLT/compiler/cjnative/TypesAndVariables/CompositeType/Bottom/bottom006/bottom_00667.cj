/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

// func test() = (return 1..10) .. (return 2..10): (return 3..10)

// return type is Interface-Hashable because of resolve least common super type of Range<Nothing> and Range<Int64>
func test() {
    (return (1..10))..(return (2..10)) : (return (3..10))
}

main(): Int64 {
    for (i in test()) {
        if (i == 1) {
            return 0
        }
    }
    return 1
}
// ASSERT: scan sema_expr_in_forin_must_has_iterator
