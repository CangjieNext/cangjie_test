// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// ERRCHECK: %compiler %f %diag_json 2>&1

struct SSS {
    var x: Int64 = 0
    mut func foo(): Int64 {
        x = 1
        1
    }
    mut func bar(): Int64 {
        var bound = { =>
            foo()
        }
        baz(bound)
    }
    mut func baz(f: () -> Int64): Int64 {
        f()
    }
}

extend SSS {
    mut func jam() {
        var bound = { => foo() }
    }
}

main () {
    var s = SSS()
    s.bar()
}
// ASSERT: scan-2 "DiagKind": "sema_capture_this_or_instance_field_in_func",
// ASSERT: scan "Errors": 2,