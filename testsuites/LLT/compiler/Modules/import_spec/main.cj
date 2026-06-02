// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION) DEPENDENCE: testa.cj
// (DEBUG_OPTION) EXEC: %compiler %compile_lib_opt testa.cj -o testa.%middle
// (DEBUG_OPTION) EXEC: %frontendCompiler %dump-ast %f 2>&1 | compare %f

internal import a.b.*
internal import a.b.b
import a.b

main() {}

/* SCAN-IN
    ImportSpec: * {
      prefixPaths: a.b
      modifier: internal
      isDecl: 0
    }
    ImportSpec: b {
      prefixPaths: a.b
      modifier: internal
      isDecl: 1
    }
    ImportSpec: b {
      prefixPaths: a
      isDecl: 0
    }
    ImportSpec: * {
      prefixPaths: std.core
      isDecl: 0
    }
*/
