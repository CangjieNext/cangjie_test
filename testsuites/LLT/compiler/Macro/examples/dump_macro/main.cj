// DEPENDENCE: define.cj
// (DEBUG_OPTION)EXEC: %compiler %cmp_macro define.cj
// (DEBUG_OPTION)EXEC: %pwd_to_ld_path %frontendCompiler --dump-macro %cmp_opt %f -o %output

// ASSERT: scan Dump tokens of macro NO. 1
// ASSERT: scan let y : Int32 = 2
// ASSERT: scan func getA ( ) {
// ASSERT: scan return a_

import pkg1.*

@Foo
struct Data {
    let x: Int32 = 1
    let y: Int32 = 2
}

@Bar
func test() {}

main() {
    0
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
