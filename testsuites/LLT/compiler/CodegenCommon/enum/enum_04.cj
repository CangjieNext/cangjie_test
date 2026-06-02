// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f %overflowOpt %enableO2 -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct Struct_SSS {
    var var_bbb: (Int64, Enum_YJQ) = (100, Enum_YJQ.defaultValue) // var_bbb: T2_lBZN7default8Enum_YJQEE, RefEnum-ty
    public func goo() {
        var yyy: (Int64, Enum_YJQ) = var_bbb //     yyy: T2_lNN7default8Enum_YJQEE
        println(yyy[0])
        return 0
    }
}

enum Enum_YJQ {
    defaultValue
    | valueOne
    | enumValue_SSS(Struct_SSS)
}

main() {
    Struct_SSS().goo()
    0
}
