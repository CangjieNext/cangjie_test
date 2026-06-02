// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
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
