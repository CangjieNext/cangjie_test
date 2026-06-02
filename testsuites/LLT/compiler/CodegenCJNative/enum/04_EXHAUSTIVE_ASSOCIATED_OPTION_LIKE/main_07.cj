// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Some(s)=999

struct SSS<T> {
    public var sss: T

    init(x: T) {
        sss = x
    }
}

enum OptionLike<M, N> {
    None
    | Some(SSS<N>)
}

main(): Int64 {
    var OptionLike_Some = Some<Bool, Int64>(SSS<Int64>(999))
    var res: Int64 = match (OptionLike_Some) {
        case Some(s) =>
            println("Some(s)=${s.sss}");
            0
        case _ => 1
    }
    return res
}
