// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public let aa: Any = 1

public class CC {
    public static let c1: Any = 1
    let c2: Any = 3
}

main(): Int64 {
    var a1 = CC.c1
    var bb: Any = 2
    var cc = CC()
    var dd = cc.c2
    return 0
}
