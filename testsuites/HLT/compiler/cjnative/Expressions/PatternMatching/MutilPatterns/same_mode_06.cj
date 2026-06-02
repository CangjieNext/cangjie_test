/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args
let type1 = "String type"

enum A {
    Year2

    func foo() {
        if (true) {
            var sameMode: String = match (type1) {
                case _: String | _: Rune | _: Int64 | _: Float64 | _: Bool => "pass"
                case _ => "fail"
            }
            return sameMode
        }
        return ""
    }
}

main(): Int64 {
    if (A.Year2.foo() == "pass") {
        return 0
    } else {
        return 1
    }
}
