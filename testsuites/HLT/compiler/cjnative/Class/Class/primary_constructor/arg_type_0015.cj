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
class Hi {
    public Hi(var b!: Int32 = 0) {
        this.b = b
    }
}

class Data {
    public Data(var a: (Hi) -> Unit) {
        this.a = a
    }
}

func run(): Bool {
    let myfunc = {
        a: Hi => a.b = 4
    }
    let myHi = Hi(b: 5)

    var value: Data = Data(myfunc);

    value.a(myHi)

    return myHi.b == 4
}

main(): Int64 {
    if (run()) {
        return 0
    };
    return 1
}
