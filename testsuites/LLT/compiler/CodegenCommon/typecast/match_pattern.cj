// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args

main() {
    var var360: Array<Array<Float64>> = [[119.0, 126.0, (-47.0), 41.0, 3.0], [(-54.0), (-92.0), 106.0, 45.0, 101.0],
        [(-91.0), (-21.0), (-8.0), 98.0, (-33.0)], [(-118.0), (-42.0), 111.0, (-24.0), 14.0],
        [59.0, (-105.0), (-56.0), (-88.0), (-77.0)]]
    var a: (UInt16, (Int16, Range<Int32>, Unit, Int64, Int64), Option<Array<Array<Float64>>>, Array<Rune>, Bool) = (UInt16(109),
        (Int16(22), ((Int32(55))..(Int32(-113)) : ((-42) | 1)), (), (-55), Int64((-120.0))),
        Option<Array<Array<Float64>>>.Some(var360), [r'f', r'T', r'M', r't', r'H'], false)
    match (a) {
        case (caseVar707, _: Array<Float64>, caseVar708: Range<UInt32>, caseVar709: Array<Rune>, true) => return 1
        case _ => return 0
    }
    0
}
