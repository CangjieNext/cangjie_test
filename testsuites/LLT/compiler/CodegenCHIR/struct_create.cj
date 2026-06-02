// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// EXEC-5: %run %run_opt %n.%suffix

struct Point {
    var x = 3
    var y = 2
}

main() {
    var p = Point()
    var res = p.x + p.y
    res
}
