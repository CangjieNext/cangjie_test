/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test<T>() {
    var x: Range<T> // type here
    x = return // means bottom is Range<T> type`s child type.
}

main(): Int64 {
    test<Unit>()
    return 0
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
