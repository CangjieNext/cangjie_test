// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f

interface Floatable<T> {
    static func GetMinNormal(): T
    operator func <(f: Float64): Bool
}

extend Float64 <: Floatable<Float64> {
    public static func GetMinNormal() {
        MinNormal
    }
}

class FloatDefault<T> where T <: Floatable<T> & Comparable<T> {
    func float_occurs_different_ranges() {
        var _ = {f: T => f < T.GetMinNormal()}
    }
}

main() {
    FloatDefault<Float64>().float_occurs_different_ranges()
    0
}
