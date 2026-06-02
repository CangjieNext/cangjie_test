// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class Data {
    public var i: Int64
    private init(x: Int32) {
        this.i = 4
    }
    public init(x: Float32, str: String) {
        this(Int32(3))
    }
}

main(): Int64 {
    var data = Data(3.14, "hi")

    return 1
}
