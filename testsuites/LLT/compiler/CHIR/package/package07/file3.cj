// LEVEL: 0
// DEPENDENCE: p1
// DEPENDENCE: p2
// (DEBUG_OPTION) EXEC:%compiler  p1/file1.cj %compile_lib_opt -o file1.%middle
// (DEBUG_OPTION) EXEC:%compiler  p2/file2.cj %compile_lib_opt -o file2.%middle
// (DEBUG_OPTION) EXEC:%compiler  %dumpCHIRDebug file1.%middle file2.%middle file3.cj -o %output
// (Linux and DEBUG_OPTION) EXEC-PIPE-0: %cat %chilDebugFileDIR/0_chirbase_lite.%chilDebugFileExt 2>&1 | compare %f
// (Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat .\file3_CHIRDebug\0_chirbase_lite.%chilDebugFileExt 2>&1 | compare %f
// (DEBUG_OPTION) EXEC:%run %run_opt %output %run_args
// ASSERT: regex invoke\(%[0-9]+, foo\(id: %[0-9]+\)\)
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal import test1.*
internal import test2.*

abstract class A1 <: A {
    public func foo(): Int64 {
        return 1
    }
}

open class A11 <: A1 {

}

open class A12 <: A1 {

}

main() {
    var a:A = C()  
    
    a.foo() - 2  //invoke
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
