/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output

main(): Int64 {
    return 0
}

// if-else's Type is Nothing ,is Sub of Bool.but while block will not visit.
// T0 is Unit,T1 is Unit
func case05() {
    while (if (true) {
            return ()
        } else {
            return ()
        }) {
        print("yes")
    }
}

// inner while return Bool,is a lambda expression.
func case09() {
    while ({
            =>
            while (true) {
                break
            };
            true
        }()) {
        print("yes")
    }
}
