class Data < D, C > {
    public var a = 0O1

    public var b = 0O2

    public Data(a: C, b: Int32, c: Int32) {
    }
}
let run = { =>
    var a: Int32 = 0O10
    let b: Bool = false
    return Int64(Data < Int32, Int32 >(a, a, a).a)
}

main(): Int64 {
    return run()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
