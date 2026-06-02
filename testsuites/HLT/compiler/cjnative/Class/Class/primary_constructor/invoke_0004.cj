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

open class Data {
    public Data(var a!: Bool = false) {
    }
}

open class Data2 <: Data {}

open class Data3 <: Data2 {}

open class Data4 <: Data3 {}

open class Data5 <: Data4 {}

open class Data6 <: Data5 {}

open class Data7 <: Data6 {}

open class Data8 <: Data7 {}

open class Data9 <: Data8 {}

open class Data10 <: Data9 {}

open class Data11 <: Data10 {}

open class Data12 <: Data11 {
    Data12(var aa!: Data = Data()) {
    }
}

main(): Int64 {
    var a: Data12 = Data12()
    if (a.aa.a) {
        return 1
    }
    return 0
}
