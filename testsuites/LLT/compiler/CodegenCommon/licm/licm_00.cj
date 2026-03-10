// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %enableO2 %enableCompileDebug %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
// ASSERT: scan result=true

public open class C0 {
    static prop aaa: Int {
        get() { Int64(-3) }
    }

    public open func goo(): Bool {
        func foo<T0>(): Bool {
            try {
                Float64(-1.0)
            } finally {
                match (aaa) {
                    case tmp => Float64(-18.0)
                }
            }
            true
        }
        foo<Unit>()
    }
}

main() { 
    println("result=${C0().goo()}")
 }