// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC:%compiler %n.cj %compile_lib_opt
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class AAA {
    public var width = 10
    public var length: Int64
    public static var rrr = 30
    public AAA(qqq: Int64, eee: Int64) {
        this.width = qqq
        this.length = eee
        rrr = eee
    }
}

main() {
    var cc = AAA(1, 2)
    var dd = AAA(2, 3)
    var a = 10
    return 0
}
