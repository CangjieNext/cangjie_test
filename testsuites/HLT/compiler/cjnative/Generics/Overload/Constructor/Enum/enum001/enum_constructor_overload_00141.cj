/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class Base {}

class Sub {}

enum X {
    a((Base) -> Unit)
}

enum Y {
    a((Sub) -> Unit)
}

func g(a: Base): Unit {}

func g(a: Sub): Unit {}

main(): Int64 {
    var j = a(g)
    return 1
}
// ASSERT: scan sema_multiple_constructor_in_enum
