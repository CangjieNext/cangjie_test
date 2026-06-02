/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args  
enum E {
    T

    func test() {
        var a = "HELLO"
        var b = 0
        for (i in a) {
            b += Int64(i)
            if (b > 200) {
                break
            }
        }
        return b
    }
}

main() {
    var a = E.T
    return a.test() - 217
}
