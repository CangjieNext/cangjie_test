// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj
// RUN-EXEC-PIPE-0: %run main 2>&1 | compare %f
// ASSERT: scan 111333
// ASSERT: scan-not 222

func foo(): Nothing {
    print("111")
    throw Exception()
}

main() {
    var a: Int64
    try {
        a = foo()
        print("222")
    } catch (_) {
        print("333")
    }
}
