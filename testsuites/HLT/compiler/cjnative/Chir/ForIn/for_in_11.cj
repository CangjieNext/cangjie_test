/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan NegativeArraySizeException: this is E
var a = "HELLO"

struct A {
    func test() {
        var b = 0
        for (i in a where Int64(i) == 69) {
            throw NegativeArraySizeException("this is E")
        }
        return b
    }
}

main() {
    var temp = A()
    return temp.test()
}
