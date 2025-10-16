/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
import test_stable_abi.*

main() {
    var count = 0
    let f1 = Father1(5)
    let g1 = Generics1<Int64>(101)

    if (f1.v1 == 0 && f1.v2 == 1 && f1.v3 == 5 
        && f1.foo1(9) == 10 && Father1.foo2(90) == 100) {
        count++
    }

    if (g1._v1 == 0 && g1._v2 == 1 && g1._v3 == 101
        && g1.goo1(1) == 10 && Generics1<UInt64>.goo2(10) == 100
        && g1.goo3(123) == 123) {
        count++
    }

    if (count == 2) {
        return 0        
    } else {
        return 1
    }
}


