/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface Ioo {}

class Coo <: Ioo {}

class Data<T> {}

func run(): Int64 {
    let data: Data<Ioo> = Data<Ioo>() // Coo->Ioo
    var castOP = data as Ioo // Coo->Ioo
    return 0
}

main(): Int64 {
    return run()
}
