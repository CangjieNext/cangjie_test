// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
internal import std.ast.*

main(): Int64 {
    let tokens = quote( e: Exception1 | Exception2 )
    let aa = ExceptTypePattern(tokens)
    aa.dump()
    return 0
}

/* SCAN-IN
ExceptTypePattern {
  -pattern: VarPattern {
    -identifier: Token {
      value: "e"
      kind: IDENTIFIER
      pos: 6: 25
    }
  }
  -colon: Token {
    value: ":"
    kind: COLON
    pos: 6: 26
  }
  -types: 0, RefType {
    -identifier: Token {
      value: "Exception1"
      kind: IDENTIFIER
      pos: 6: 28
    }
  }
  -types: 1, RefType {
    -identifier: Token {
      value: "Exception2"
      kind: IDENTIFIER
      pos: 6: 41
    }
  }
}
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
