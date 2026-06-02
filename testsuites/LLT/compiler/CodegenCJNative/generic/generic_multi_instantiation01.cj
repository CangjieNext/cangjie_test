// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %n.%suffix 2>&1 | compare %f
// EXEC: %run %run_opt %n.%suffix

class B<K> {
    public func test(a: K): K {
        return a
    }
}

main(): Int64 {
    var t1 = B<Int64>()
    let num = t1.test(1024)
    print("${num}\n")

    var t2 = B<Float64>()
    let ff = t2.test(1.23456)
    print("${ff}\n")

    var t3 = B<Bool>()
    let tt = t3.test(true)
    print("${tt}\n")

    if (num == 1024 && ff == 1.23456 && tt) {
        return 0
    }
    return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
