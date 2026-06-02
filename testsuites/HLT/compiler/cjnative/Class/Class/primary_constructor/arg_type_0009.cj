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
    public Data(var a: Array<Int64>) {
        this.a = a
    }
}

func run(): Bool {
    var value: Data = Data([1, 2, 3]);
    return (value.a[0] == 1) && (value.a[1] == 2) && (value.a[2] == 3)
}

main(): Int64 {
    if (run()) {
        return 0
    };
    return 1
}
