/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.convert.*
import std.collection.*
import std.time.*
import std.math.*
import std.regex.*
import std.core.*
import std.convert.*

extend String {
    func _split( separateStr: String) : Array<String> {
        var result: ArrayList<String> = ArrayList<String>()
        var currentComponent = ""
        for ( char in this) {
            if ( char.toString() == separateStr) {
                result.add(currentComponent)
                currentComponent = ""
            } else {
                currentComponent + char.toString()
            }
        }
        if ( !(currentComponent.isEmpty())) {
            result.add(currentComponent)
        }
        return result.toArray()
    }
    

	
    func matche( regexp: String) : ?Array<String> {
        let regex = Regex(regexp)
        if(regex.string().isEmpty()) {
            return Option<Array<String>>.None
        }
        let input = this
        let mdArr = regex.matcher(input).find()
        if (mdArr.isNone()) {
            return Option<Array<String>>.None
        }
        let strArr = Array<String>(1, {_ => mdArr.getOrThrow().matchString()})
        return strArr
    }
    
    /*
     * Determine whether a string matches a regular rule
     */
    func test( str: String) : Bool {
        return Regex(this).matcher(str).matchStart().isSome()
    }
}

/*
 * Obtains the preceding digit in a string. For example, "123you"-> 123
 */
func parseInt( inputString: String) : Int64 {
    var numberString = ""
    for ( char in inputString.runes()) {
        if ( char.isAsciiNumber()) {
            // Add to numberString if the character is a number
            numberString = numberString + char.toString()
        } else {
            break
        }
    }
    return Int64.parse(numberString)
}
