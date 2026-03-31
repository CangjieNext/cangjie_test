// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %f -o %n.%suffix 2>&1
// EXEC-PIPE-0: %run %run_opt %output

public interface I<T> {
    func lam(f: (T) -> T): T
}

extend Int64 <: I<Int64> {
    public func lam(f: (Int64) -> Int64): Int64 {
        return f(0)
    }
}

func example<T>(t: T) where T <: I<T> {
    t.lam({x => x})
}

main() {
    return example(42)
}





