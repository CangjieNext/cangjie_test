// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public class classtype01 {
    var a: Int64
    public init(x: Int64) {
        a = x
    }
}

private var vctc = classtype01(10)

main(): Int64 {
    return 0 // expr vctc
}
