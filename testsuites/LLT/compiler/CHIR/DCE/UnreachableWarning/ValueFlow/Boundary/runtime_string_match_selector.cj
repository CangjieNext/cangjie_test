// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A String returned by an ordinary function is not a compile-time selector.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func runtimeText(): String {
    "ready"
}

main() {
    let text = runtimeText()
    match (text) {
        case "stopped" => println("not inferred unreachable")
        case _ => println("fallback")
    }
}

/* SCAN
*/
