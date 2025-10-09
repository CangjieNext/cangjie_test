// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (LLVM) EXEC: %compiler %cmp_opt %debugCHIROpt %n.cj -o %output
// (LLVM) EXEC: %run %run_opt %output %run_args
// (LLVM) EXEC: %frontendCompiler %dump-ir %cmp_opt %n.cj 2>&1 | compare %f
// (LLVM) ASSERT: scan-12 call i8* @llvm.cj.blackhole(i8*
 
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
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

