// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// An exclave in a non-tail position (inside an if branch) of a function without a return type
// annotation does not affect return type inference: CalcFuncRetTyFromBody collects the exclave
// body types itself.

// EXEC: %compiler %cmp_opt %f -Woff all -o %output

class C {
    init() {}
    init(this @local!) { exclave {} }
}

func makeC(): C @local! {
    exclave { C() }
}

func f(x: Bool) {
    if (x) {
        exclave { makeC() }
    }
}

main() {}
