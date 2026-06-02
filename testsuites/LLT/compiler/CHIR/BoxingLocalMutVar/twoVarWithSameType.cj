// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 55

func foo(): Unit {
    var counter1 = 0
    var counter2 = 0
    func f1(): Unit {
        counter1++
        counter2++
        if (counter1 + counter2 < 10) {
            f1()
        }
    }
    f1()
    print(counter1)
    print(counter2)
}

main() {
    foo()
}
