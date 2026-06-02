/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args|compare %f
// ASSERT: scan success1

//class HashSet<T> <: Collection<T>  where T <: Hashable & Equatable<T>
import std.collection.*

var str1: Array<String> = ["a", "b"]
var str2: String = "c"
var r1: HashSet<String> = HashSet<String>(str1)

main(): Int64 {
    if (r1.isChanged() == false) {
        print("success1\n")
        return 0
    }
    return 1
}

extend<T> HashSet<T> where T <: Hashable & Equatable<T> {
    public func isChanged(): Bool {
        return false
    }
}
