// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC:%compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

@M1
class A1 {
    func getX(): String {
        // In Cangjie \0 will be encoded as ASCII 0.
        // null(\0) in String should not cut the string, premuturally.
        let a = "hello \0 \0 \0 world, 你好世界"
        return a
    }
}

class A2 {
    public func getX(): String {
        // In Cangjie \0 will be encoded as ASCII 0.
        // null(\0) in String should not cut the string, premuturally.
        let a = "hello \0 \0 \0 world, 你好世界"
        return a
    }
}

main() {
    let a1 = A1()
    let x1 = a1.getX()
    if (x1 != "hello \0 \0 \0 world, 你好世界") {
        return 1
    }

    // No macro, this should always work.
    let a2 = A2()
    let x2 = a2.getX()
    if (x2 != "hello \0 \0 \0 world, 你好世界") {
        return 2
    }
    if (x1.size != x2.size) {
        return 3;
    }
    0
}
