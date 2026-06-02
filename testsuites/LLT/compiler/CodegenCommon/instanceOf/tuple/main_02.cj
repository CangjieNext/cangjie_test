// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

open class A1 {}

open class A2 <: A1 {}

open class A3 <: A2 {}

func assert<T>(input: T): T {
    return input
}

main() {
    var tuple2 = (A3(), A3())
    var temp = assert<(A2, A2)>(tuple2)
    if (temp is (A2, A3)) {
        return 0
    } else {
        return 1
    }
}
