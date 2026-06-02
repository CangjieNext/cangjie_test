// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f %diag_json -o %output 2>&1 | compare %f



var a : Float32 = 102.0
func b(bn ! : Option<Range<Int16>*Int64*Range<Int16>*Range<UInt32>*Range<UInt64>>,
 bo ! : (Result,   Range) -> Bool , bp ! : Int32, bq ! : Unit*UInt16*List<UInt64> = ((), 0, [])) : Result<UInt16> {
    let bu : ?(Range<Int16>*Int64*Range<Int16>*Range<UInt32>*Range<UInt64>) = Option<Range<Int16>*Int64*Range<Int16>*Range<UInt32>*Range<UInt64>>.None
    if (false) { Err(Exception()) } else { b(bn : bu, bo : { bv , bw =>     
        true
     }, bp : 5) } 
}
func c(co ! : Float32 , cp ! : Range<Int64> = 9..161)  
{ 
    c(co : try { 
        let cq = UInt8(0)
        a
    } catch (d: Exception) { 
        a
    })
    match (0) {
        case cr =>
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan parse_case_body_cannot_be_empty
