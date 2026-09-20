// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [S4_body_kinds] 终止表达式承载位置: interface 默认方法/static/getter/operator/lambda
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: §4.1 S4（不同 body 各立诊断根; 规格 Counter/示例的静态方法/属性 getter/operator 形态）
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// ASSERT: scan-5 "DiagKind": "chir_dce_unreachable_expression_hint"

interface Greeter {
    func greeting(): String {
        return "hello"
        return "unreachable greeting"
    }
}

class Holder {
    static func stop(): Int64 {
        return 1
        2
    }

    prop enabled: Bool {
        get() {
            return true
            return false
        }
    }
}

struct Num {
    let v: Int64
    init(v: Int64) { this.v = v }

    operator func +(other: Num): Num {
        return Num(this.v + other.v)
        Num(0)
    }
}

main() {
    let action = {
        =>
        throw Exception()
        println("unreachable lambda")
    }
    try {
        action()
    } catch (e: Exception) {
    }
    println(Holder.stop())
    println(Holder().enabled)
    println((Num(1) + Num(2)).v)
}
