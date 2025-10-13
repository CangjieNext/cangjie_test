// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 111222333

public func goo<M>(y:M):(M, VArray<Int64, $3>) {
    var aaa:VArray<Int64, $3> = [111, 222, 333]
    return (y, aaa)
}

main() {
    var varr = goo(100)[1]
    for (item in 0..3) {
        print(varr[item])
    }
    return 0
}
