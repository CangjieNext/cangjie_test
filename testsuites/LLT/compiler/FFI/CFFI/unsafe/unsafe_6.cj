// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// ERRCHECK: %compiler %cmp_opt_chir2hlir %f -o %output
// ASSERT: regex unexpected modifier 'unsafe' on primary constructor

public struct Data {
    unsafe public Data() {
        var f = { tmp: Int64 => B() }
        var n = { tmp: Int64 => B() }(1)
        A(arg: ({ tmp: Int64 => B() }(1)))
    }
}

public func A(arg!: UInt8): Unit {
}

unsafe public func B(): UInt8 {
    UInt8(1)
}

main(): Int64 {
    var d = unsafe { Data() }
    return 0
}
