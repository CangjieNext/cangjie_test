/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

import std.math.*

struct ResolveMapStruct {
    public let v: Any
    public let tag: String
    public let l: Array<String>

    public ResolveMapStruct(v: Any, tag: String, l: Array<String>) {
        this.v = v
        this.tag = tag
        this.l = l
    }
}

let resolveMapList = [
    ResolveMapStruct(true, "YamlBoolTag", ["y", "Y", "yes", "Yes", "YES"]),
    ResolveMapStruct(true, "YamlBoolTag", ["true", "True", "TRUE"]),
    ResolveMapStruct(true, "YamlBoolTag", ["on", "On", "ON"]),
    ResolveMapStruct(false, "YamlBoolTag", ["n", "N", "no", "No", "NO"]),
    ResolveMapStruct(false, "YamlBoolTag", ["false", "False", "FALSE"]),
    ResolveMapStruct(false, "YamlBoolTag", ["off", "Off", "OFF"]),
    ResolveMapStruct(None, "YamlNullTag", ["", "~", "null", "Null", "NULL"]),
    ResolveMapStruct(Float64.NaN, "YamlFloatTag", [".nan", ".NaN", ".NAN"]),
    ResolveMapStruct(Float64.Inf, "YamlFloatTag", [".inf", ".Inf", ".INF"]),
    ResolveMapStruct(Float64.Inf, "YamlFloatTag", ["+.inf", "+.Inf", "+.INF"]),
    ResolveMapStruct(Float64.Inf * -1.0, "YamlFloatTag", ["-.inf", "-.Inf", "-.INF"]),
    ResolveMapStruct("<<", "YamlMergeTag", ["<<"])
]
// (not target_ios) ASSERT: scan sema_missing_entry
// ASSERT: scan sema_generic_type_without_type_argument
