func foo<T>() {
    let a:Int64 = 0
    a
}
class B<T> {
    var a = { =>
        for (i in 0..10) {
            spawn {
                var b = foo<Int64>()
                b++
            }
        }
        return 0
    }
}

main() {
    B<Int64>().a()
    return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
