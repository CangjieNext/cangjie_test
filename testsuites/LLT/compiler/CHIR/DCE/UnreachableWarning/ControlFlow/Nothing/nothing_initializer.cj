// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify Nothing in nested and direct initializers keeps declaration continuations distinct.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f
// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"

class NothingObject {
    init(value: Nothing) {}
}
func stop(): Nothing { throw Exception() }
func consumeObject(value: NothingObject) {}

func local(): Int64 {
    var local = NothingObject(stop())
    println("unreachable after Nothing initializer")
    0
}

func nested(): Int64 {
    consumeObject(NothingObject(stop()))
    println("unreachable after nested Nothing call")
    0
}

main() { local(); nested() }
