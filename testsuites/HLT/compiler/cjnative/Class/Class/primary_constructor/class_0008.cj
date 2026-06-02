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

abstract class Data {
    public Data(var a!: Int32 = 1, var b!: Int32 = 2) {
        this.a = a
        this.b = b
    }
}

class Data2 <: Data {
    public Data2(var aa!: Int32 = 3, var bb!: Int32 = 4) {
        this.a = aa
        this.b = bb
    }
}

func run(): Int64 {
    var value = Data2()
    return Int64(value.a - 3)
}

main(): Int64 {
    return run()
}
