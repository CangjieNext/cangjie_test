/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

import std.ast.*

main() {
    let tk = quote(
        internal import ORGA::{
            pkgA.subB.pkg,
            pkgB.*,
            pkgC.subD as ACD
        }
    )
    let parsed = parseProgram(tk)
    let importContent = parsed.importLists[0].content
    importContent.orgName.dump()
    importContent.orgSeparator.dump()
    importContent.toTokens().toString() |> println
    importContent.dump()
}
/* SCAN
description: identifier, token_id: 137, token_literal_value: ORGA, fileID: 1, line: 15, column: 25
description: double_colon, token_id: 163, token_literal_value: ::, fileID: 1, line: 15, column: 29
ORGA :: { pkgA.subB.pkg, pkgB.*, pkgC.subD as ACD }
-importKind: Multi
-orgName: Token {
  value: "ORGA"
  kind: IDENTIFIER
  pos: 15: 25
}
-orgSepartaor: Token {
  value: "::"
  kind: DOUBLE_COLON
  pos: 15: 29
}
-leftCurl: Token {
  value: "{"
  kind: LCURL
  pos: 15: 31
}
  -importKind: Single
  prefixPath: 0: Token {
    value: "pkgA"
    kind: IDENTIFIER
    pos: 16: 13
  }
  prefixPath: 1: Token {
    value: "subB"
    kind: IDENTIFIER
    pos: 16: 18
  }
  -identifier: Token {
    value: "pkg"
    kind: IDENTIFIER
    pos: 16: 23
  }
-comma: Token {
  value: ","
  kind: COMMA
  pos: 16: 26
}
  -importKind: All
  prefixPath: 0: Token {
    value: "pkgB"
    kind: IDENTIFIER
    pos: 17: 13
  }
  -identifier: Token {
    value: "*"
    kind: MUL
    pos: 17: 18
  }
-comma: Token {
  value: ","
  kind: COMMA
  pos: 17: 19
}
  -importKind: Alias
  prefixPath: 0: Token {
    value: "pkgC"
    kind: IDENTIFIER
    pos: 18: 13
  }
  -identifier: Token {
    value: "subD"
    kind: IDENTIFIER
    pos: 18: 18
  }
  -importAlias 0: Token {
    value: "as"
    kind: AS
    pos: 18: 23
  }
  -importAlias 1: Token {
    value: "ACD"
    kind: IDENTIFIER
    pos: 18: 26
  }
-rightCurl: Token {
  value: "}"
  kind: RCURL
  pos: 19: 9
}
*/