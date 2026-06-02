/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface Ioo {
    let a: Int32 = 2
}

enum Time<T> where T <: Ioo {
    Day(T)
}


func run(): Int64 {
    var time: Time<Ioo>
    var res: Int32 = match (time) {
        case Day(x) =>
            var a:Int32 = match (x) { // x is Ioo
                case y:Ioo => 2
                case _ => 1
            }
            a
    }
    if ( res == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_unexpected_declaration_in_scope
