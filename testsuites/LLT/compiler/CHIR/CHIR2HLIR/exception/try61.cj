// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC-PIPE-1: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan An exception has occurred:
// ASSERT: scan try61.cj:19
// ASSERT: scan-not success

func test() {
    try {
        throw Exception()
    } finally {
        try {
            throw Exception()
        } finally {
            return 10
        }
    }
}

main() {
    var res = test()
    print("success")
    return res - 10
}
