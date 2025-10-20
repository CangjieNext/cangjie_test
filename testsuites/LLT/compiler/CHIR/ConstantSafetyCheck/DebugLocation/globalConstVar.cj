// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// LEVEL 0
// EXEC: %compiler %f %compile_lib_opt %dumpCHIRDebug
// (Linux) : sed -r -n '/Func @_CGV7default3strHv/,/^}$/p' default_CHIR_Debug/0_AST_CHIR.chirtxt | compare %f
 
const str = "Test" + "String"
 
// ASSERT: scan-2 Constant
// ASSERT: scan Store
// ASSERT: scan-not loc: 