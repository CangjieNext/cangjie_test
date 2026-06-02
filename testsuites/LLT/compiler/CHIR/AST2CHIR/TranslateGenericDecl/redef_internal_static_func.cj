// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: %n.pkg.cj
// EXEC: %compiler %n.pkg.cj %compile_lib_opt -o libp1.%lib_extension
// EXEC: %compiler %f libp1.%lib_extension -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Y


public import default.d1.*

public open class Class_1743945200442_637 <: Class_1743945200442_9<Int64> {
    static func func_1743945200442_656() {
        println("Y")
    }
}

main() {
    Class_1743945200442_637.foo()
}
