// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

protected let VALIDREGEXSTR = ##"^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)$"##
protected let VALIDREGEX = Regex(VALIDREGEXSTR)
protected func validateAndParse(version: String): String {
    //let matchResult = validate(version)
    //if (!matchResult) {
    //    throw IllegalArgumentException("Not valid semantic version: ${version} received")
    //}

    let arr = VALIDREGEX.matcher(version).fullMatch()

    match (arr) {
        case Some(r) =>
            // println("groupNum : ${r.groupNumber()}")
            if (r.groupNumber() > 0) {
                for (i in 1..=r.groupNumber()) {
                    println("group ${i} : ${r.matchString(i)}")
                    let pos = r.matchPosition(i)
                    println("position : [${pos.start}, ${pos.end})")
                }
            } else {
                // 还能到这里？
                throw IllegalArgumentException(
                    "Not valid semantic version: ${version} received,groupNumber() = ${r.groupNumber()}")
            }
        case None => println("None")
    }
    return version
}