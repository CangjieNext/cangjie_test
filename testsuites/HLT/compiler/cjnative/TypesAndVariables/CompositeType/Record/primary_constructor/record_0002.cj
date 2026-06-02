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

func run(): Int64 {
    var value: Data = Data();
    if ((value.a == 3) && (value.b == 4)) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}

struct Data {
    public var a: Int32 = 1
    public var b: Int32 = 2
    public Data() {
        a = 3
        b = 4
    }
}
