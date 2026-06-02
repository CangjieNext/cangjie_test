/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_10_a12_01

  @Level:         1

  @Assertion:   2.1.10(12) Examples of struct definition:
                struct Rectangle1 {
                let width1: Int32
                let length1: Int32
                let perimeter1: () -> Int32
                init (width1: Int32, length1: Int32) {
                this.width1 = width1
                this.length1 = length1
                this.perimeter1 = { => 2 * (width1 + length1) }
                }
                init (side: Int32) {
                this(side, side)
                }
                func area1(): Int32 { width1 * length1 }
                }

                // Define a generic struct type.
                struct Pair<T1, T2> {
                let first: T1
                let second: T2
                init (f: T1, s: T2) {
                this.first = f
                this.second = s
                }
                }

  @Description: Checks that the struct types, defined above, work correctly.

  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

import utils.assert.*

struct Rectangle1 {
    let width1: Int32
    let length1: Int32
    let perimeter1: () -> Int32
    init (width1: Int32, length1: Int32) {
        this.width1 = width1
        this.length1 = length1
        this.perimeter1 = { => 2 * (width1 + length1) }
    }

    init (side: Int32) {
    this(side, side)
    }

    func area1(): Int32 { width1 * length1 }
}

// Define a generic struct type.
struct Pair<T1, T2> {
    let first: T1
    let second: T2
    init (f: T1, s: T2) {
        this.first = f
        this.second = s
    }
}

main() {
    // Test case 1
    var rectangle = Rectangle1(2, 3);
    Assert.equals(6, rectangle.area1(), 
        reason: "Test case 1 FAILED.");

    var pair = Pair<Int16, Int32>(100, 200);

    // Test case 2
    Assert.equals(100, pair.first, 
        reason: "Test case 2 FAILED.");

    // Test case 3
    Assert.equals(200, pair.second, 
        reason: "Test case 3 FAILED.");

    return 0;
}

