/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan following constraints for type variable 'Generics-R' cannot be solved

func g<R>(): R where R <: String {
    let v: Int64 = g()
    return g<R>()
}

main() {
    var a: Int64 = g()
}
