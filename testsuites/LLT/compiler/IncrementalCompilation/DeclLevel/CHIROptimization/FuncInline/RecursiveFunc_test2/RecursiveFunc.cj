// DEPENDENCE: %n.txt
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output | compare %f
// EXEC: %cpfile %n.txt %n.cj
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output 2>&1

func foo1(a!: Int32 = 1): Int32 {
    func foo2(b!: Int32 = 2): Int32 {
        func foo3(c!: Int32 = 3): Int32 {
            foo1()
            return 2
        }
        foo3()
        return 3
    }
    foo2()
    return 4
}

func goo1(a!: Int32 = 1): Int32 {
    func goo2(b!: Int32 = 2): Int32 {
        func goo3(c!: Int32 = 3): Int32 {
            goo2()
            return 2
        }
        goo3()
        return 3
    }
    goo2()
    return 4
}

func hoo1(a!: Int32 = 1): Int32 {
    func hoo2(b!: Int32 = 2): Int32 {
        func hoo3(c!: Int32 = 3): Int32 {
            return 1
        }
        hoo3()
        hoo1()
    }
    hoo2()
    return 4
}

func joo1(a!: Int32 = 1): Int32 {
    func joo2(b!: Int32 = 2): Int32 {
        func joo3(c!: Int32 = 3): Int32 {
            return 1
        }
        joo3()
    }
    joo2()
    return 4
}

main(): Int32 {
    foo1() + goo1() + hoo1() + joo1()
}

/* SCAN-IN
foo1(l:6, c:1) -> main(l:55, c:1),
goo1(l:19, c:1) -> main(l:55, c:1),
hoo1(l:32, c:1) -> main(l:55, c:1),
joo1(l:44, c:1) -> main(l:55, c:1),
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
