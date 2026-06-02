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
// ASSERT: scan-10 The finally block is executed.
var a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

class A {
    func test() {
        var b = 0
        for (i in a where i < 11) {
            try {
                b += i
            } catch (e: NegativeArraySizeException) {
                println("Exception info: ${e}.")
            } finally {
                println("The finally block is executed.")
            }
        }
        return b
    }
}

main() {
    var temp = A()
    return temp.test() - 55
}
