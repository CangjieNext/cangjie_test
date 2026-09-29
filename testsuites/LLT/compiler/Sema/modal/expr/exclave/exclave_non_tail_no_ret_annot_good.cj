// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Exclave expressions in non-tail positions (both branches of an if, whose types are joined)
// of a function without a return type annotation do not affect return type inference:
// CalcFuncRetTyFromBody collects the exclave body types itself.

// EXEC: %compiler %cmp_opt %f -Woff all -o %output

class C {
    init() {}
    init(this @local!) { exclave {} }
}

func use(c: C @local!): Unit {}

func f(c: C @local!, x: Bool) {
    if (x) {
        exclave { use(c) }
    } else {
        exclave { use(c) }
    }
}

main() {}
