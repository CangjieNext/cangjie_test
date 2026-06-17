/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DESC: 在CFunc函数体中，调用具有override关系的open函数，判定调用了正确的override版本函数
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f

open class AAA {
    public open func print(): Unit {
        println("AAA.print")
    }
}

open class BBB <: AAA {
    public open override func print(): Unit {
        // ASSERT: scan BBB.print
        println("BBB.print")
    }
}

main(): Int64 {
    let cf: CFunc<() -> Unit> = {
        =>
            var bbb: AAA = BBB()
            bbb.print()
    }
    unsafe {
        cf()
    }
    0
}
