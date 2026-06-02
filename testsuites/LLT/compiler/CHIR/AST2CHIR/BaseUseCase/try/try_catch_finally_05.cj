// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-PIPE-1: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan An exception has occurred:
// ASSERT: scan try_catch_finally_05.cj:35
// ASSERT: scan abc

func test() {
    try {
        try {
            throw Exception()
        } finally {
            print("a");
            return 1
        }
    } catch (_) {
        try {
            throw Exception()
        } catch (_) {
            throw Exception()
        } finally {
            print("b");
            return 5
        } // will not print b.
    } finally {
        try {
            throw Exception()
        } catch (_) {
            throw Exception()
        } finally {
            print("c");
            return 10
        }
    }
}

main() {
    var res = test()
    return res
}
