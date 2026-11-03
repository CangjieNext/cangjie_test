// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %local %f

struct P {
    var x: Int64 = 0
    init() {}
    init(this @local!) { exclave { x = 0 } }
}

@C
struct S {}

func arrayCopy(a: S @local!) {
    let x: Array<S> @local! = [a]
}

func varrayInternal() {
    let y: VArray<P, $2> @local! = [P() @local!, P() @local!]
}

main() {}
