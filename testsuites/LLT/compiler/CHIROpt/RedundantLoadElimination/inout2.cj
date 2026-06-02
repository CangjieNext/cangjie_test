// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %disableCodegen %enableO2 -Woff all %f -o %n.%suffix 2>&1 | compare %f

foreign func PlusOne(ptr: CPointer<Int32>): Unit

main() {
    var a: Int32 = 0
    try {
        unsafe { PlusOne(inout a) }
    } finally {}
    println(a)
    println(a)
    println(a)
    try {
        unsafe { PlusOne(inout a) }
    } finally {}
    println(a)
}

// ASSERT: regex-not \[RLE\] The usages of the result of Load at \[8,.*\] have been replaced
// ASSERT: scan [RLE] The usages of the result of Load at [17,13] have been replaced by the value at [16,13]
// ASSERT: scan [RLE] The usages of the result of Load at [18,13] have been replaced by the value at [16,13]
// ASSERT: regex-not [RLE] The usages of the result of Load at [12,.*] have been replaced
