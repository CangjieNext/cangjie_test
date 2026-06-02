/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
import std.runtime.*
class A{
    ~init(){}{} 
}
func test(){
    var a = A()
}

main(){
    test()
    GC()
    return 0
}
// ASSERT: scan parse_expected_character
