// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan flag is 1.
internal import std.runtime.*
var flag = 0

class A{
    ~init(){flag+=1}
}

func test(){
    var a = A()
}

main() {
    test()
    GC()
    sleep(Duration.millisecond * 200)
    print("flag is ${flag}.\n")
    return 0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
