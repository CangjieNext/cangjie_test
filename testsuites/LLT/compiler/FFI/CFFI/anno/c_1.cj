// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f %diag_json -o %output 2>&1 | compare %f
// ASSERT: scan-4 sema_illegal_use_of_annotation
// ASSERT: scan-4 sema_illegal_scope_use_of_annotation

@C
class Person {
    @C
    var age_: Int64 = 0

    @C
    mut prop age: Int64 {
        get() { age_ }

        set(v) { age_ = v }
    }

    @C
    func sayHi() {}

    @C
    init(age: Int64) {
        age_ = age
    }

    @C
    Person(name: String) { }
}

var a = if (true) {
    @C
    func sayHi() {}
}

@C
main() {}
