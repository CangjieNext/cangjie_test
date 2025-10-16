// LEVEL: 0
// EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan The func node in the line:15 and the column:14 was optimized by The opt: Redundant Return Removal
// ASSERT: scan The func node in the line:16 and the column:14 was optimized by The opt: Redundant Return Removal
// ASSERT: scan The func node in the line:17 and the column:14 was optimized by The opt: Redundant Return Removal
// ASSERT: scan The func node in the line:21 and the column:1 was optimized by The opt: Redundant Return Removal
// ASSERT: scan The func node in the line:20 and the column:1 was optimized by The opt: Redundant Return Removal
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var a = 0
var f1:Unit = while ( a > 0 ){
    var a: Int32 = 1
    let b: Int32 = 2
    var x2 = { => b}
    var x3 = { => a}()
    var x4 = { => b}()
}

func foo(x:()->Int32){return x}
func goo(x:Int32){return x}


main():Int64 {
    if ( f1 != ()  ){
        return 1
    }
    return 0
}



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
