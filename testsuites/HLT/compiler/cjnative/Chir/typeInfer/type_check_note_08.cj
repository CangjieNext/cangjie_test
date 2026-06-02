/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan constraint 'Generics-R <: Struct-String' may come from

func f<T>() where T <: String {
    func g<R>(): R where R <: T & String {
        let v: Int64 = g()
        return g<R>()
    }
}

main() {
    var a: Int64 = f()
}
