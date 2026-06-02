// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var c: Int32 = 0

struct R {
    public var value: Int32 = 2
    public func a(): Int32 {
        c = 10
        return 0
    }
}

var b = R().a

main(): Int64 {
    b()
    if (c == 10) {
        return 0
    }
    return 1
}
