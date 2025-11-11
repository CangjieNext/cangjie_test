// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %dumpCHIRDebug %n.cj %compile_lib_opt
// (DEBUG_OPTION)EXEC:compare %f < default_CHIR/0_AST_CHIR.chir

enum A {
    B | C
}

enum K2 {
    B | C | ...
}

// ASSERT: regex \[internal\] enum @_(Z|C)N7default1AE
// ASSERT: regex \[internal\] \[nonExhaustive\] enum @_(Z|C)N7default2K2E 
