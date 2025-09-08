// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir %n
// EXEC: %cpfile %n.old.cj %n
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o %output
// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o %output 2>&1 | compare %f
// RUN-EXEC-1: %run %run_opt %output %run_args

import p1.*

main() {
    unsafe {
        let a = CPointer<UInt8>()
        let b: I1<Int32> = a 
        let c = Int64(b.bar())
        return c
    }
}

interface I2 {
}
extend<T> CPointer<T> <: I2 {}

// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file ImportedExtendCPointer_AddPubMethod.old.cj in line 6 in column 1
// ASSERT: scan the changed decl after Spreading is:foo in file ImportedExtendCPointer_AddPubMethod.old.cj in line 7 in column 17
// ASSERT: scan the changed decl after Spreading is:main in file ImportedExtendCPointer_AddPubMethod.cj in line 13 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file c_pointer_resource.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file ImportedExtendCPointer_AddPubMethod.cj in line 24 in column 1

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
