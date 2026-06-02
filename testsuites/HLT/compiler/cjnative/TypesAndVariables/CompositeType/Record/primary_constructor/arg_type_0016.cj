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

struct Hi {
    public Hi(let a: Int32) {}
}

struct Data {
    public Data(var a: Hi) {
        this.a = a
    }
}

func run(): Bool {
    var value: Data = Data(Hi(5));
    return value.a.a == 5
}

main(): Int64 {
    if (run()) {
        return 0
    };
    return 1
}
