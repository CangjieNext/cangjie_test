// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f %diag_json -o %n.%suffix 2>&1 | compare %f

struct R1 {
    public var i = 0
}

extend R1 {
    public mut func foo1() {
        let f = {=> this}

        func goo() {
            this
        }
        return 0
    }

    public mut func foo2() {
        let f = {=> this.i = 2}

        func goo() {
            this.i = 2
        }
        return 0
    }

    public mut func foo3() {
        let f = {=> this.i}

        func goo() {
            this.i
        }
        return 0
    }

    public mut func foo4() {
        let f = {=> i}

        func goo() {
            i
        }
        return 0
    }

    public mut func foo5() {
        return this
    }

    public mut func foo6() {
        var a = this
        return a
    }
}

main() {
    return 1
}
// ASSERT: scan sema_capture_this_or_instance_field_in_func
// ASSERT: scan sema_use_this_as_an_expression_in_func
