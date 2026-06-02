/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
package test_local

import std.fs.*
import std.convert.*
import std.time.*

foreign func CJ_TIME_GetLocalTimeOffset(): Int64

// 获取未设置TZ 或者 TZPath时时区名

func getlocalname(): String {
    let path = canonicalize(Path("/etc/localtime")).toString()
    if (let Some(pos) <- path.lastIndexOf("zoneinfo")) {
        var substring = path[(pos + 8)..path.size] // 8 is the size of "zoneinfo"
        if (let Some(pos) <- substring.indexOf("/")) {
            return substring[pos + 1..]
        }
    }
    return "local"
}

// get timezone which name is UTC+Offset
func getLocalByOffset(): TimeZone {
    let offset = unsafe { CJ_TIME_GetLocalTimeOffset() }
    if (offset == 0) {
        return TimeZone.UTC
    }
    let duration = Duration.minute * offset
    let hour = duration.toHours()
    let minute = duration.abs().toMinutes() % 60
    let name = "UTC${hour.format("+.2")}:${minute.format(".2")}"
    return TimeZone(name, duration)
}
