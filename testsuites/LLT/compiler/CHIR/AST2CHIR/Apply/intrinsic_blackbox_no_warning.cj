// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %frontendCompiler %chir2llvm  %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: scan-not warning
 
import std.runtime.*
 
class CA {
}
 
struct SA {

}
 
var a = 3
main () {
    var b = CA()
    blackBox(b);
    var c = 1
    blackBox(c)
    var d = blackBox(c) + 1
    blackBox(d)
    var e = SA()
    blackBox(e)
    var f = {=>1}
    blackBox(f)
 
    let bb = CA()
    blackBox(bb);
    let cc = 1
    blackBox(cc)
    let dd = blackBox(cc) + 1
    blackBox(dd)
    let ee = SA()
    blackBox(ee)
    let ff = {=>1}
    blackBox(ff)
 
    0
}

