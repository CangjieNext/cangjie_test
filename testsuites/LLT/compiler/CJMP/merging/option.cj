// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

@Frozen
public func f(): (?Int64, ?Int64) {
    (Option<Int64>.Some(42), Option<Int64>.None)
}

public class A<T> {
    public static let x = Option<Int64>.Some(42)
    public static let y = Option<Int64>.None
}

extend A<Unit> {
    public static func g(): (?Int64, ?Int64) {
        (Option<Int64>.Some(42), Option<Int64>.None)
    }
}



// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

// SEPARATE-FILE: m.cj
// EXEC-0: %compiler %noColor m.cj --import-path=./c -L./p -lcmp -o %output
import cmp.*

main(): Unit {
    match(f()) {
        case (Some(x), None) where x == 42 => println(x)
        case _ => throw Exception()
    }

    match (A<Unit>.g()) {
        case (Some(x), None) where x == 42 => println(x)
        case _ => throw Exception()
    }

    match ((A<Unit>.x, A<Unit>.y)) {
        case (Some(x), None) where x == 42 => println(x)
        case _ => throw Exception()
    }
}

// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
/* SCAN
42
42
42
*/
