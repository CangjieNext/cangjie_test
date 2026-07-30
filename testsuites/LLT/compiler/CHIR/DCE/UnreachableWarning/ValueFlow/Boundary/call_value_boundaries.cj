// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Calls invalidate tracked vars, preserve immutable values, and do not propagate results.
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

interface StaticObserver {
    static func observe(): Unit
}

class ConcreteStaticObserver <: StaticObserver {
    public static func observe(): Unit {}
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

    let immutableValue = 1
    observe()
    if (immutableValue < 0) {
        println("unreachable immutable condition after ordinary call")
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

func verifyStaticCall<T>() where T <: StaticObserver {
    var mutableValue = 1
    T.observe()
    if (mutableValue < 0) {
        println("reachable after static dispatch")
    }
}

func verifyExceptionalCalls<T>(observer: InterfaceObserver) where T <: StaticObserver {
    var applyValue = 1
    try {
        observe()
    } catch (_: Exception) {}
    if (applyValue < 0) {
        println("reachable after exceptional ordinary call")
    }

    var invokeValue = 1
    try {
        observer.observe()
    } catch (_: Exception) {}
    if (invokeValue < 0) {
        println("reachable after exceptional interface call")
    }

    var staticValue = 1
    try {
        T.observe()
    } catch (_: Exception) {}
    if (staticValue < 0) {
        println("reachable after exceptional static dispatch")
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
    verifyStaticCall<ConcreteStaticObserver>()
    verifyExceptionalCalls<ConcreteStaticObserver>(ConcreteInterfaceObserver())
    functionResultDoesNotPropagate()
}

/* SCAN
warning: unreachable block in 'if' expression
  ==> call_value_boundaries.cj:45:28:
   | 
45 |       if (constantValue < 0) {
   |  ____________________________^
46 | |         println("unreachable const condition after ordinary call")
47 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> call_value_boundaries.cj:51:29:
   | 
51 |       if (immutableValue < 0) {
   |  _____________________________^
52 | |         println("unreachable immutable condition after ordinary call")
53 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> call_value_boundaries.cj:65:28:
   | 
65 |       if (constantValue < 0) {
   |  ____________________________^
66 | |         println("unreachable const condition after interface call")
67 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable block in 'if' expression
  ==> call_value_boundaries.cj:79:28:
   | 
79 |       if (constantValue < 0) {
   |  ____________________________^
80 | |         println("unreachable const condition after virtual call")
81 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

4 warnings generated, 4 warnings printed.
*/
