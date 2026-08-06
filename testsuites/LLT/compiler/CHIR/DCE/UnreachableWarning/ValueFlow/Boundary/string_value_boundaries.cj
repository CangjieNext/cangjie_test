// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// String Apply and property access do not become value-flow facts.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-not "DiagKind":

func runtimeText(): String {
    "ready"
}

main() {
    const constantText = "one"
    match (constantText) {
        case "two" => println("not diagnosed through a const String comparison")
        case _ => println("const String fallback")
    }

    match ("one") {
        case "two" => println("not diagnosed through a literal String comparison")
        case _ => println("literal String fallback")
    }

    let runtime = runtimeText()
    match (runtime) {
        case "stopped" => println("not diagnosed through a runtime String selector")
        case _ => println("runtime String fallback")
    }

    let lhs = "ab" + ""
    let rhs = "a" + "b"
    if (lhs != rhs) {
        println("not diagnosed through a String relation")
    }

    let text = "one"
    if (text.size == 5) {
        println("not diagnosed through a String property")
    }
}
