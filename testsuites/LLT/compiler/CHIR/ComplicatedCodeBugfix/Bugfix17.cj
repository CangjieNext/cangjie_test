// LEVEL: 0
// EXEC: %compiler %debugCHIROpt %import-cangjie-stdx %cmp_opt %f -o %output
// EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

internal import stdx.encoding.json.*
internal import std.collection.*

main() {

    var str = """
    {
        "mysql":{
            "user":"test",
            "password":"123456"
        },
        "user":{
            "usercode":"admin",
            "password":"123456"
        }
    }"""
    var jsonValue = JsonValue.fromStr(str)

    println(jsonValue.asObject().getFields())
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
