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
    a((Base) -> Unit, Sub)
}

enum Y {
    a((Sub, Sub) -> Unit, Base)
}

func g(a: Base, b: Sub): Unit {}

func g(a: Sub, b: Base): Unit {}

main(): Int64 {
    var j = a(g, Base())
    return 1
}
// ASSERT: scan sema_no_match_function_declaration_for_ref
