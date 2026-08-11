// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: ideal float literal (IDEAL_FLOAT) inside a generic-call lambda
// argument must also stay pending during inference, mirroring the IDEAL_INT
// path. Expected type is `FT<() -> Float32>` carried by a function's return
// type. Before the fix the literal `0.5` was fixed to Float64 too early and
// inference failed.

// EXEC: %compiler %cmp_opt %f -o %output

class FT<T> {
    init(a: T) {}
}

func make() : FT<() -> Float32> {
    return FT({=> 0.5})
}

main() {}
