/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms

import std.time.*
import std.collection.*
import std.regex.*
import std.random.*

let letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

var endResult = StringBuilder("")

func doTest() {
    endResult = StringBuilder("")

    // make up email address
    for (k in 0..4000) {
        let username = makeName(6)
        var email: String = ""
        if ((k%2) == 1) {
            email = username + "@mac.com"
        } else {
            email = username + "(at)mac.com"
        }

        // validate the email address
        let pattern = Regex("^[a-zA-Z0-9\\-_.]+@[a-zA-Z0-9\\-_]+(\\.?[a-zA-Z0-9\\-_]*)\\.[a-zA-Z]{2,3}$")

        if (pattern.matcher(email).fullMatch().isSome()) {
            let r = email + " appears to be a valid email address."
            addResult(r)
        } else {
            let r = email + " does NOT appear to be a valid email address."
            addResult(r)
        }
    }

    // make up ZIP codes
    for (s in 0..4000) {
        var zipGood:Bool = true
        var zip:String = makeNumber(4)

        if ((s%2) == 1) {
            zip = zip + "xyz"
        } else {
            zip = zip + "7"
        }

        // validate the zip code
        for (i in 0..zip.size) {
            let ch = zip[i..i+1]
            let cArr: Array<String> = ["0","1","2","3","4","5","6","7","8","9"]
            if (!cArr.contains(ch)) {
                zipGood = false
                let r = zip + " contains letters."
                addResult(r)
            }
        }
        
        if (zipGood && zip.size > 5) {
            zipGood = false
            let r = zip + " is longer than five characters."
            addResult(r)
        }
        
        if (zipGood) {
            let r = zip + " appears to be a valid ZIP code."
            addResult(r)
        }
    }
}
var rand = Random()

func makeName(n: Int): String {
    var tmp = StringBuilder("")
    for (_ in 0..n) {
        let l = rand.nextInt64(26)
        tmp.append(letters[l])
    }
   return tmp.toString()
}

func makeNumber(n: Int): String {
   var tmp = StringBuilder("")
   for (_ in 0..n) {
        let l = rand.nextInt64(10)
        tmp.append(l)
   }
   return tmp.toString()
}

func addResult(r: String) {
    endResult.append("\n")
    endResult.append(r)
}

/*
 *  @State
 *  @Tags Jetstream2
 */
class StringValidateInput {
    /*
     *  @StringValidateInput
     */
    func runIteration() {
        doTest()
    }
}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

main() {
    let start = Timer().getTime()
    StringValidateInput().runIteration()
    let end = Timer().getTime()
    println("StringValidateInput1: ms = ${Float64((end-start).toNanoseconds())/1000000.0}")
}