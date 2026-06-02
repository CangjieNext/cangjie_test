// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

public class ARR<T> {
    var f: T
    public init() {
        this.f = unsafe { zeroValue<T>() }
    }
}

public interface Base {}

main() {
    var v = ARR<Base>()
    return 0
}
