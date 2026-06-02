/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class A {
    func test() {
        try {
            1
        } catch (e: ArithmeticException) {
            true
        } catch (_) {
            ()
        }
        0
    }
    mut prop a: Int64 {
        get() {
            try {
                1
            } catch (e: ArithmeticException) {
                true
            } catch (_) {
                ()
            }
            1
        }
        set(value) {
            a = value
        }
    }
}

main() {
    A().test()
    A().a
    return 0
}
