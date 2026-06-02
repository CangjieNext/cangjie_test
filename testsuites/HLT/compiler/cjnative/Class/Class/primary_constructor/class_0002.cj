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
open class Base {
    public Base(var a!: Int32 = 1, var b!: Int32 = 2) {
        this.a = a
        this.b = b
    }
}

class Data <: Base {
    public Data(var aa!: Int32 = 1, var bb!: Int32 = 2) {
        this.a = aa
        this.b = bb
    }
}

func run(): Int64 {
    var value: Base = Base(a: 3, b: 4);
    var value2: Data = Data(aa: 5, bb: 6);
    if ((value.a == 3) && (value.b == 4)) {
        let value: Base = Base()
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
