// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Exception1\nException2\nException3\nException4\nException5\nException6\nException7\nException8\nException9\nException10\nException11\n

var a = 300

func goo() {
    if (true) {
        UInt8(a)
    } else {
        UInt8(1)
    }
}

func foo(): UInt8 {
    UInt8(a)
}

func work(): Unit {
    try {
        UInt8(a)
    } catch (_) {
        print("Exception3\n")
    }
}

main() {
    let v1 = try {
        UInt8(a);
        ()
    } catch (_) {
        print("Exception1\n")
    }
    try {
        if (true) {
            UInt8(a)
        } else {
            UInt8(1)
        }
    } catch (_) {
        print("Exception2\n")
    }
    work()
    try {
        goo()
    } catch (_) {
        print("Exception4\n")
    }
    try {
        foo()
    } catch (_) {
        print("Exception5\n")
    }
    try {
        match (true) {
            case _ => UInt8(a)
        }
    } catch (_) {
        print("Exception6\n")
    }
    try {
        try {
            UInt8(a);
            ()
        } catch (_) {
            print("Exception7\n");
            match (true) {
                case _ => UInt8(a)
            }
        }
    } catch (_) {
        print("Exception8\n")
    }
    try {
        let v = try {
            UInt8(a);
            ()
        } catch (_) {
            match (true) {
                case _ => UInt8(a)
            };
            print("unreachable\n")
        }
    } catch (_) {
        print("Exception9\n")
    }
    try {
        let v = try {
            UInt8(a);
            ()
        } catch (_) {
            print("Exception10\n")
        } finally {
            match (true) {
                case _ => UInt8(a)
            }
        }
    } catch (_) {
        print("Exception11\n")
    }
    0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
