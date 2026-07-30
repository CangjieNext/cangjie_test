// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Calls invalidate tracked vars, preserve const values, and do not propagate results.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func observe() {}

interface InterfaceObserver {
    func observe(): Unit
}

class ConcreteInterfaceObserver <: InterfaceObserver {
    public func observe(): Unit {}
}

open class VirtualObserver {
    public open func observe() {}
}

class ConcreteVirtualObserver <: VirtualObserver {
    public override func observe() {}
}

func verifyNormalCall() {
    var mutableValue = 1
    observe()
    if (mutableValue < 0) {
        println("reachable after ordinary call")
    }

    const constantValue = 1
    observe()
    if (constantValue < 0) {
        println("unreachable const condition after ordinary call")
    }
}

func verifyInterfaceCall(observer: InterfaceObserver) {
    var mutableValue = 1
    observer.observe()
    if (mutableValue < 0) {
        println("reachable after interface call")
    }

    const constantValue = 1
    observer.observe()
    if (constantValue < 0) {
        println("unreachable const condition after interface call")
    }
}

func verifyVirtualCall(observer: VirtualObserver) {
    var mutableValue = 1
    observer.observe()
    if (mutableValue < 0) {
        println("reachable after virtual call")
    }

    const constantValue = 1
    observer.observe()
    if (constantValue < 0) {
        println("unreachable const condition after virtual call")
    }
}

func makeValue(): Int64 {
    1
}

func functionResultDoesNotPropagate() {
    var value = makeValue()
    if (value < 0) {
        println("not diagnosed")
    }
}

main() {
    verifyNormalCall()
    verifyInterfaceCall(ConcreteInterfaceObserver())
    verifyVirtualCall(ConcreteVirtualObserver())
    functionResultDoesNotPropagate()
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> call_value_boundaries.cj:37:28:
   | 
37 |       if (constantValue < 0) {
   |  ____________________________^
38 | |         println("unreachable const condition after ordinary call")
39 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> call_value_boundaries.cj:51:28:
   | 
51 |       if (constantValue < 0) {
   |  ____________________________^
52 | |         println("unreachable const condition after interface call")
53 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> call_value_boundaries.cj:65:28:
   | 
65 |       if (constantValue < 0) {
   |  ____________________________^
66 | |         println("unreachable const condition after virtual call")
67 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
