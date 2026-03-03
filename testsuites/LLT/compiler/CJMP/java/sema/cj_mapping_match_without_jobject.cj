// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop %enable_java_cjmapping  --output-javagen-dir=./ 2>& 1 | compare %f

import interoplib.interop.*
func foo(b: Bool) {
    match(b) {
        case true => println("ok")
        case false => println("nok")
    }
}

/*
Original issue description: when %enable_java_cjmapping option is enabled, then MatchExpr is desugared
requiring java.lang.JObject to be imported.
*/

// ASSERT: scan-not error
// ASSERT: scan-not JObject
