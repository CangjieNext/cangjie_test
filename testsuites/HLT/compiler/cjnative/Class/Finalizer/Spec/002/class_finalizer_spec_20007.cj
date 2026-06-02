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
var flag = 0

class A{
    open ~init(){flag+=1} 
}

func test(){
    var a = A()
}

main(){
    test()
    print("flag is ${flag}.")
    GC()
    sleep(Duration.millisecond * 200)
    print("flag is ${flag}.")
    return 0
}
// ASSERT: scan parse_illegal_modifier_in_scope
