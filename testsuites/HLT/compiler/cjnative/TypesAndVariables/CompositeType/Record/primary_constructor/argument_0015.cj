/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

struct Data {
    public Data(a!: Bool = false, var x!: Bool = a) {
    }
}

struct Data2 {
    public Data2(a!: Bool, let x!: Bool = a) {
    }
}

struct Data3 {
    public Data3(a: Bool, let x!: Bool = a) {
    }
}

func run(): Int32 {
    var data: Data = Data()
    var data2: Data2 = Data2(a: true)
    var data3: Data3 = Data3(true)

    if (!data.x && data2.x && data3.x) {
        return 0
    }
    return 1
}

main(): Int64 {
    return Int64(run())
}
