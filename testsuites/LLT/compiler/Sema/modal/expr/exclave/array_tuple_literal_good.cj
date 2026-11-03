// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Inside exclave the external @local! elements become internal, so the literal is valid.

// EXEC: %compiler %local %f -o %output

func arrayLocal(a: String @local!): Array<String> @local! {
    exclave { [a, a] }
}

func tupleLocal(a: String @local!): (String, String) @local! {
    exclave { (a, a) }
}

main() {}
