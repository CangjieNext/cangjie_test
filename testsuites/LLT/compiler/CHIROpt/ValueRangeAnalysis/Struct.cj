// LEVEL: 0
// EXEC:%compiler %enableO2 %debugCHIROpt %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC:%run %run_opt %output

struct B {
    var a: Int64
    let b = 3
    init(a1: Int64) {
        a = a1
    }
    func f() {}
}
main() {
    var b = B(3)
    b.f()
    b.a = 10
    b.a
    b.b
    0
}

// ASSERT: scan-not core dumped


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
