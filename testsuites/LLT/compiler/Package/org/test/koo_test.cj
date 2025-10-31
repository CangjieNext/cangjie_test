// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: koo.cj
// EXEC: %mkdir test@huawei
// EXEC: %compiler koo.cj %compile_lib_opt -o libtest.koo@huawei.a --output-dir=test@huawei
// EXEC: %compiler %f --import-path=. -Ltest@huawei -ltest.koo@huawei -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f

package huawei::test
internal import huawei::test.koo.*

main(): Int64 {
    let res = z + k
    println(res)
    let res2 = concatM("a", "b")
    println(res2)
    return 0
}

public func concatM(s1: String, s2: String): String {
    var a = 1
    return s1 + s2
}

// ASSERT: scan-begin 38
// ASSERT: scan-next ab
