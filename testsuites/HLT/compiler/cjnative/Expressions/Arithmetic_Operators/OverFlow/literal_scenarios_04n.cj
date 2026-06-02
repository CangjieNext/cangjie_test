/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1|compare %f

class Data {
    public var a = .3243
    public init(x: Float64) {
        a = x
    }
    public func foo(): Float64 {
        return a
    }
}

main() {
    Data(2.10e-325).foo()
    ()
}
// ASSERT: scan sema_float_literal_too_small
