// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct Tensor<T> {
    var no: Int64
    init(no: Int64) {
        this.no = no
    }
}

func ZerosTensor<T>(shape: Array<Int32>): Tensor<T> {
    return Tensor<T>(0)
}

func ErrorTensor<T>(): Tensor<T> {
    return ZerosTensor<T>([0])
}

main(): Int64 {
    ErrorTensor<Float32>()
    return 0
}
