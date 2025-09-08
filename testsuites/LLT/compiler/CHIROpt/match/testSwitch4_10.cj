// (CJNATIVE) EXEC: %compiler %cmp_opt %enableSwitchOpt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC: %run %run_opt %output %run_args
// (CJNATIVE) ASSERT: scan line:10 and the column:9 was optimized by The opt: switchOpt

var a = 0 is Int8
var b = 3
func test() { 
    var g = 3
    do {
        match (g) {
            case 4 => 
                break
                0
            case _ => 
                b
        }
    } while (a)  }
main() {
    test()
    return 0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
