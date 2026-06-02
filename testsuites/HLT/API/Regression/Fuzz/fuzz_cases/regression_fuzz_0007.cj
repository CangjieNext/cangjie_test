/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output


import std.collection 
import std.convert 
class Data { 
    public Data(var a: HashMap < Int32, Bool >) { 
        this.a = a 
    } 
} 
func run(): Bool { 
    var value: Data = Data(HashMap < Int32, Bool >([(Int64.parse(1.toString()), Bool.parse(true.toString())),(Int64.parse(2.toString()), Bool.parse(false.toString()))])) 
    match(value.a.get(Int64.parse(1.toString()))) { 
        case Some(Bool.parse(true.toString())) => Bool.parse(true.toString()) 
        case Some(Bool.parse(false.toString())) => Bool.parse(false.toString()) 
        case _ => Bool.parse(false.toString()) 
    } 
} 
main(): Int64 { 
    
    if(run()) { 
        return Int64.parse(0.toString()) 
    }
    return Int64.parse(1.toString()) 
}
// ASSERT: scan parse_expected_pattern
