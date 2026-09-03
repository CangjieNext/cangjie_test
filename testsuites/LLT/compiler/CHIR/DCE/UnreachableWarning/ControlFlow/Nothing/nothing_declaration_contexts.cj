// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify Nothing successors in declaration-body contexts.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-6 "DiagKind": "chir_dce_unreachable_expression_hint"

class ThrowingHolder {
    init() {
        throw Exception()
        // EXPECT: chir_dce_unreachable_expression_hint
        println("unreachable initializer")
    }
}

interface Greeter {
    func greeting(): String {
        return "hello"
        // EXPECT: chir_dce_unreachable_expression_hint
        return "unreachable greeting"
    }
}

class PropertyHolder {
    prop enabled: Bool {
        get() {
            return true
            // EXPECT: chir_dce_unreachable_expression_hint
            return false
        }
    }

    static func create(): PropertyHolder {
        return PropertyHolder()
        // EXPECT: chir_dce_unreachable_expression_hint
        return PropertyHolder()
    }

    func id(): Int64 {
        0
    }
}

struct Counter {
    let value: Int64

    init(value: Int64) {
        this.value = value
    }

    operator func +(other: Counter): Counter {
        return Counter(other.value)
        // EXPECT: chir_dce_unreachable_expression_hint
        return Counter(0)
    }
}

main() {
    let action = {
        =>
        throw Exception()
        // EXPECT: chir_dce_unreachable_expression_hint
        println("unreachable lambda")
    }
    action()
    println(PropertyHolder().enabled)
    println(PropertyHolder.create().id())
    println((Counter(1) + Counter(2)).value)
}
