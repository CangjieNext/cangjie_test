// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct Rcd {
    public func test(): Int32 {
        return 10
    }
}

main(): Int64 {
    var rr: Rcd = Rcd()
    if (rr.test() == 10) {
        return 0
    }
    return 1
}
