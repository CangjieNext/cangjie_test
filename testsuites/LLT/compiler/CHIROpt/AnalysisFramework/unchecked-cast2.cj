// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output

class CA {}

struct SA {
    var ca = CA()
}

struct SC {
    var x = 3
}

func foo(): Int64 {
    var x: SA = SA()
    match (x) {
        case sc: SC => sc.x
        case _ => 0
    }
}

main() {
    foo()
}
