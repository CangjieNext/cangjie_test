/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

struct Data {
    public Data(x: Int32, var p0!: Int32 = 5, var p1!: Int32 = 5, var p2!: Int32 = 5, var p3!: Int32 = 5,
        var p4!: Int32 = 5, var p5!: Int32 = 5, var p6!: Int32 = 5, var p7!: Int32 = 5, var p8!: Int32 = 5,
        var p9!: Int32 = 5, var p10!: Int32 = 5, var p11!: Int32 = 5, var p12!: Int32 = 5, var p13!: Int32 = 5,
        var p14!: Int32 = 5, var p15!: Int32 = 5, var p16!: Int32 = 5, var p17!: Int32 = 5, var p18!: Int32 = 5,
        var p19!: Int32 = 5, var p20!: Int32 = 5, var p21!: Int32 = 5, let p22!: Int32 = 5, var p23!: Int32 = 5,
        var p24!: Int32 = 5, var p25!: Int32 = 5, var p26!: Int32 = 5, var p27!: Int32 = 5, var p28!: Int32 = 5,
        var p29!: Int32 = 5, var p30!: Int32 = 5, var p31!: Int32 = 5, var p32!: Int32 = 5, var p33!: Int32 = 5,
        let p34!: Int32 = 5, var p35!: Int32 = 5, var p36!: Int32 = 5, var p37!: Int32 = 5, var p38!: Int32 = 5,
        var p39!: Int32 = 5, let p40!: Int32 = 5, var p41!: Int32 = 5, var p42!: Int32 = 5, var p43!: Int32 = 5,
        var p44!: Int32 = 5, var p45!: Int32 = 5, var p46!: Int32 = 5, var p47!: Int32 = 5, var p48!: Int32 = 5,
        var p49!: Int32 = 5, var p50!: Int32 = 5, let p51!: Int32 = 5, var p52!: Int32 = 5, var p53!: Int32 = 5,
        var p54!: Int32 = 5, var p55!: Int32 = 5, var p56!: Int32 = 5, var p57!: Int32 = 5, var p58!: Int32 = 5,
        var p59!: Int32 = 5, var p60!: Int32 = 5, var p61!: Int32 = 5, var p62!: Int32 = 5, var p63!: Int32 = 5,
        var p64!: Int32 = 5, var p65!: Int32 = 5, var p66!: Int32 = 5, var p67!: Int32 = 5, var p68!: Int32 = 5,
        var p69!: Int32 = 5, var p70!: Int32 = 5, var p71!: Int32 = 5, var p72!: Int32 = 5, var p73!: Int32 = 5,
        var p74!: Int32 = 5, var p75!: Int32 = 5, var p76!: Int32 = 5, var p77!: Int32 = 5, var p78!: Int32 = 5,
        var p79!: Int32 = 5, var p80!: Int32 = 5, let p81!: Int32 = 5, var p82!: Int32 = 5, var p83!: Int32 = 5,
        var p84!: Int32 = 5, var p85!: Int32 = 5, var p86!: Int32 = 5, var p87!: Int32 = 5, var p88!: Int32 = 5,
        var p89!: Int32 = 5, var p90!: Int32 = 5, var p91!: Int32 = 5, var p92!: Int32 = 5, var p93!: Int32 = 5,
        var p94!: Int32 = 5, var p95!: Int32 = 5, var p96!: Int32 = 5, var p97!: Int32 = 5, var p98!: Int32 = 5,
        var p99!: Int32 = 5, var p100!: Int32 = 5) {
    }
}

func run(): Bool {
    var value: Data = Data(9);
    return value.p100 == 5
}

main(): Int64 {
    if (run()) {
        return 0
    };
    return 1
}
