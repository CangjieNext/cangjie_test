/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    return 0
}

func case01() {
    var a: Coo = Coo()
    var m: Int32 = 1
    {
        =>
        var res = a.b + m + n;
        res
    }()
    var n: Int32 = 1
}

func case02() {
    var a: Coo = Coo()
    var m: Int32
    {
        =>
        var res = a.b + m;
        res
    }()
}

class Coo {
    public var a: Int32 = 1
    public let b: Int32 = 2
}

struct Roo {
    public var a: Int32 = 1
    public let b: Int32 = 2
}
// ASSERT: scan sema_undeclared_identifier
// ASSERT: scan sema_capture_before_initialization
