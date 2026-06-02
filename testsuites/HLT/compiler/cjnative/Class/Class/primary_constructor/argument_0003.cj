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

class Data {
    var b: Float64
    Data(var a: Int32) {
        this.a = a
        b = 2.0
    }
}

func run(): Int64 {
    var value: Data = Data(1);
    if ((value.a == 1) && (value.b == 2.0)) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
