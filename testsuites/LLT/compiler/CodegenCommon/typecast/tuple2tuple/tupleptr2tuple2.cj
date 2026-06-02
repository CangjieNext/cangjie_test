// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args

var a = ("", b()) as (String, c)

interface ad {
    func ae(): Bool
}

interface c <: ad {}

interface i<ak, al> <: c {}

class b <: i<UInt32, Range<Int16>> {
    var am = 0
    public func ae() {
        true
    }
}

main() {
    var x = (("", b()) as (String, c) ?? ("", b()))[1]
    if (x.ae()) {
        return 0
    }
    return 1
}
