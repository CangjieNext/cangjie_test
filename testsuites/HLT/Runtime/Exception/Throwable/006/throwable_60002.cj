/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args | compare %f
// ASSERT: scan test1test2test3
// ASSERT: scan-not test4

func test() {
    try {
        try {
            throw Exception()
        } catch (_) {
            throw Exception()
        } finally {
            print("test1");
            return 1
        }
    } catch (_) {
        try {
            throw Exception()
        } catch (_) {
            throw Exception()
        } finally {
            print("test2");
            return 5
        }
    } finally {
        print("test3");
        try {
            throw Exception()
        } catch (_) {
            return 10
        }
        print("test4");
    }
}

main() {
    var res = test()
    print("success")
    return res - 10
}
