// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (LLVM and not Windows) EXEC-PIPE-0: %frontendCompiler %chir2llvm %dumpCHIRDebug  %f -o %n.%suffix 2>&1
// (LLVM and not Windows) EXEC-PIPE-0: %cat %n\_CHIR/[0-9]*\_AST\_CHIR.chirtxt | %grep blackBox | compare %f
// (LLVM and not Windows) ASSERT: regex-6 Intrinsic\/blackBox<Int64>\(.*\)
// (LLVM and not Windows) ASSERT: regex-2 Intrinsic\/blackBox<Struct-_CN7default2SAE>\(.*\)
// (LLVM and not Windows) ASSERT: regex-2 Intrinsic\/blackBox<Class-_CN7default2CAE&>\(.*\)
// (LLVM and not Windows) ASSERT: regex-2 Intrinsic\/blackBox<\(\) -> Int64>\(.*\)
 
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

