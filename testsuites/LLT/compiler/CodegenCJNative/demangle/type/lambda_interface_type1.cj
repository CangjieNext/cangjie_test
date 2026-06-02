// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC-PIPE-1: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan foo(default::Tokens, (CPointer<...>) -> CPointer<...>)
class NodeFormat_Node {}

class Tokens {}

func foo(input: Tokens, nativeParse: (CPointer<UInt8>) -> CPointer<UInt8>): NodeFormat_Node {
    throw Exception("foo")
    return NodeFormat_Node()
}

main() {
    foo(Tokens(), {p: CPointer<UInt8> => return p})
    return 0
}
