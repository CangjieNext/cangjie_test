/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package upstream

import std.core.*

import std.reflect.*

@Annotation
public class Tag { public const init() {} }

@Annotation
public class MyAnnotation {
    public let data: String
    public const init(data: String) { this.data = data }
}
public var sentinelVar: Int64 = 999


public var var_int64_none: Int64 = 0

@Tag
public var var_int64_single: Int64 = 0

@Tag
@Tag
public var var_int64_dup: Int64 = 0

public var var_string_none: String = "hello"

@MyAnnotation["string"]
public var var_string_single: String = "hello"

@MyAnnotation["a"]
@MyAnnotation["b"]
public var var_string_dup: String = "hello"

public var var_float64_none: Float64 = 3.14

@Tag
public var var_float64_single: Float64 = 3.14

@Tag
@Tag
public var var_float64_dup: Float64 = 3.14

public var var_bool_none: Bool = true

@Tag
public var var_bool_single: Bool = true

@Tag
@Tag
public var var_bool_dup: Bool = true

public var var_arrInt64_none: Array<Int64> = [1, 2, 3]

@Tag
public var var_arrInt64_single: Array<Int64> = [1, 2, 3]

@Tag
@Tag
public var var_arrInt64_dup: Array<Int64> = [1, 2, 3]

public var var_arrString_none: Array<String> = ["a", "b"]

@Tag
public var var_arrString_single: Array<String> = ["a", "b"]

@Tag
@Tag
public var var_arrString_dup: Array<String> = ["a", "b"]

public var var_tuple_none: (Int64, String) = (1, "a")

@Tag
public var var_tuple_single: (Int64, String) = (1, "a")

@Tag
@Tag
public var var_tuple_dup: (Int64, String) = (1, "a")

public var var_func_none: (Int64) -> Int64 = { x => x + 1 }

@Tag
public var var_func_single: (Int64) -> Int64 = { x => x + 1 }

@Tag
@Tag
public var var_func_dup: (Int64) -> Int64 = { x => x + 1 }

public let let_int64_none: Int64 = 0

@Tag
public let let_int64_single: Int64 = 0

@Tag
@Tag
public let let_int64_dup: Int64 = 0

public let let_string_none: String = "hello"

@MyAnnotation["string"]
public let let_string_single: String = "hello"

@MyAnnotation["a"]
@MyAnnotation["b"]
public let let_string_dup: String = "hello"

public let let_float64_none: Float64 = 3.14

@Tag
public let let_float64_single: Float64 = 3.14

@Tag
@Tag
public let let_float64_dup: Float64 = 3.14

public let let_bool_none: Bool = true

@Tag
public let let_bool_single: Bool = true

@Tag
@Tag
public let let_bool_dup: Bool = true

public let let_arrInt64_none: Array<Int64> = [1, 2, 3]

@Tag
public let let_arrInt64_single: Array<Int64> = [1, 2, 3]

@Tag
@Tag
public let let_arrInt64_dup: Array<Int64> = [1, 2, 3]

public let let_arrString_none: Array<String> = ["a", "b"]

@Tag
public let let_arrString_single: Array<String> = ["a", "b"]

@Tag
@Tag
public let let_arrString_dup: Array<String> = ["a", "b"]

public let let_tuple_none: (Int64, String) = (1, "a")

@Tag
public let let_tuple_single: (Int64, String) = (1, "a")

@Tag
@Tag
public let let_tuple_dup: (Int64, String) = (1, "a")

public let let_func_none: (Int64) -> Int64 = { x => x + 1 }

@Tag
public let let_func_single: (Int64) -> Int64 = { x => x + 1 }

@Tag
@Tag
public let let_func_dup: (Int64) -> Int64 = { x => x + 1 }

public const const_int64_none: Int64 = 0

@Tag
public const const_int64_single: Int64 = 0

@Tag
@Tag
public const const_int64_dup: Int64 = 0

public const const_string_none: String = "hello"

@MyAnnotation["string"]
public const const_string_single: String = "hello"

@MyAnnotation["a"]
@MyAnnotation["b"]
public const const_string_dup: String = "hello"

public const const_float64_none: Float64 = 3.14

@Tag
public const const_float64_single: Float64 = 3.14

@Tag
@Tag
public const const_float64_dup: Float64 = 3.14

public const const_bool_none: Bool = true

@Tag
public const const_bool_single: Bool = true

@Tag
@Tag
public const const_bool_dup: Bool = true

public var 中文变量: Int64 = 9

internal var intVar: Int64 = 7

private var privVar: Int64 = 6

public func findGvar(name: String): GlobalVariableInfo {
    let arr = PackageInfo.get("upstream").variables.toArray()
    for (v in arr) {
        if (v.name == name) {
            return v
        }
    }
    throw Exception("not found: " + name)
}

