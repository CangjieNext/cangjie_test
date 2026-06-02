/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 
open class Base {}

class Data <: Base {
    public Data(var a!: Int32 = 1, var b!: Int32 = 2) {
        this.a = a
        this.b = b
    }
}

func run(): Int64 {
    var value: Data = Data(a: 3, b: 4);
    if ((value.a == 3) && (value.b == 4)) {
        let value: Data = Data()
        if ((value.a == 1) && (value.b == 2)) {
            return 0
        } else {
            return 1
        }
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
