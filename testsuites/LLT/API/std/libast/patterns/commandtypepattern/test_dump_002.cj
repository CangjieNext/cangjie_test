// EXEC: %compiler %enableEH %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %set_stdx_path %run_opt %output %run_args 2>&1 | compare %f
internal import std.ast.*

main() : Int64 {
    let tokens = quote( e: Eff )
    let aa = CommandTypePattern(tokens)
    aa.dump()
    let bb = CommandTypePattern()
    bb.pattern = aa.pattern
    bb.colon = aa.colon
    bb.types = aa.types
    bb.dump()
    return 0
}

/* SCAN
CommandTypePattern {
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
      value: "Eff"
      kind: IDENTIFIER
      pos: 6: 28
    }
  }
}
CommandTypePattern {
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
      value: "Eff"
      kind: IDENTIFIER
      pos: 6: 28
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