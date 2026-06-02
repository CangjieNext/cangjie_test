// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

public enum EXHAUSTIVE_ASSOCIATED_NONREF {
    A
    | B(Float64, Int16)
}

func foo<T>(x: T) {
    return x
}

main(): Int64 {
    var tuple: (EXHAUSTIVE_ASSOCIATED_NONREF, Array<Int64>) = (EXHAUSTIVE_ASSOCIATED_NONREF.A, [1, 21])
    var x: Option<(EXHAUSTIVE_ASSOCIATED_NONREF, Array<Int64>)> = Option<(EXHAUSTIVE_ASSOCIATED_NONREF, Array<Int64>)>
        .Some(tuple)
    foo<Option<(EXHAUSTIVE_ASSOCIATED_NONREF, Array<Int64>)>>(x)
    return 0
}
