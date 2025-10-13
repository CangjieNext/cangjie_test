// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan goo:Hello Cangjie

public func goo<M>(y:M):(M, CString) {
    var cs = unsafe {LibC.mallocCString("goo:Hello Cangjie")}
    return (y, cs)
}

main() {
    var cs = goo(100)[1]
    println(cs)
    unsafe {LibC.free(cs)}
    return 0
}
