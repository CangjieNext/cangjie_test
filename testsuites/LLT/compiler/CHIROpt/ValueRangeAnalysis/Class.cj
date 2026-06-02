// LEVEL: 0
// EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %f -o %output 2>&1 | compare %f
// EXEC:%run %run_opt %output

class A {
    var a: Int64
    init(a1: Int64) {
        a = a1
    }
    func f() {}
}

main() {
    var a = A(3)
    a.f()
    a.a = 10
}

// ASSERT: regex-not core dumped


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
