// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (aarch64) EXEC: %compiler %cmp_opt %f

@C
struct HomogeneousFloatingPointAggregate {
    HomogeneousFloatingPointAggregate(let a: Float64, let b: Float64, let c: Float64, let d: Float64) {}
}

@C
func f(): HomogeneousFloatingPointAggregate {
    return HomogeneousFloatingPointAggregate(Float64(1.0), Float64(2.0), Float64(3.0), Float64(4.0))
}

unsafe main() {
    f()
    return
}
