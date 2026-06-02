// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %enableO2 %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public open class MyException <: Exception {
    public open func myFunc() {
        1
    }
}

func test(a: Bool) {
    try {
    } catch (me: MyException) {
        if (a) {
            me.myFunc()
        }
        me.myFunc()
    }
    0
}

main() {
    test(true);
}