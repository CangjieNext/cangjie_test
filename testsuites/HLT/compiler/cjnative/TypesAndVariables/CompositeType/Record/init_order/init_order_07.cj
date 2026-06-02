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

var c: Float32 = 0.0

struct Data<T> {
    public var a: Int32 = 100
    public var b: Float32 = 200.0
    public Data() {
        a = 200
        b = 300.0
    }

    public init(a: Int32, b!: Float32 = {
            =>
            c = 10.0
            c
        }()) {
        this()
        if ((this.a == 200) && (this.b == 300.0)) {
            this.a = a
            this.b = b
        }
    }
}

func run(): Int64 {
    var value: Data<Bool> = Data<Bool>(5)
    if ((value.a == 5) && (value.b == 10.0)) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
