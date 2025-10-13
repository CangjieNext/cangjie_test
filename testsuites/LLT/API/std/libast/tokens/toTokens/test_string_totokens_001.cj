// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

import std.ast.*

main(): Int64 {
    var str = """
Here
is
a
multi
line
string
.
"""
    var tok = str.toTokens()
    tok.dump()
    str = "this is a string"
    tok = str.toTokens()
    tok.dump()
    str = "\'\'"
    tok = str.toTokens()
    tok.dump()
    str = 'this is a string'
    tok = str.toTokens()
    tok.dump()
    str = '\"\"'
    tok = str.toTokens()
    tok.dump()
    str = ##"""
    #this is a string#
    """##
    tok = str.toTokens()
    tok.dump()
    str = '#"this is a string"#'
    tok = str.toTokens()
    tok.dump()
    str = '''
    """
    """
    '''
    tok = str.toTokens()
    tok.dump()
    return 0
}

/* SCAN-IN
description: multiline_string, token_id: 149, token_literal_value: Here
is
a
multi
line
string
.
, fileID: 23, line: 204, column: 16
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
