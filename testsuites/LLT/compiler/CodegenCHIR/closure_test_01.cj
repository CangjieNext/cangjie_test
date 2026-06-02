// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// EXEC-0: %run %run_opt %n.%suffix

struct SA {
    var num = 2
}

func foo(x: SA) {
    x
}

main() {
    let a = {x: Int64 => x + 1}
    a(5) - foo(SA()).num - 4
}
