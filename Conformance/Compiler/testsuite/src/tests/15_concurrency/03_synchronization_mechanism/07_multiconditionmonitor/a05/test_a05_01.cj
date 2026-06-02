/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_07_a05_01

  @Level:         1
  @Assertion:    15.3.7(5)
    class MultiConditionMonitor <: ReentrantMutex {
       // Constructor.
       init()

       // Returns a new ConditionID associated with this monitor. May be used
       // to implement
       // "single mutex -- multiple wait queues" concurrent primitives.
       // Throws ISSE("Mutex is not locked by the current thread") if the
       // current thread does not hold this mutex.
       func newCondition(): ConditionID

       // Blocks until either a paired `notify` is invoked or `timeout`
       // toNanoseconds pass.
       // Returns `true` if the specified condition was signalled by another
       // thread or `false` on timeout.
       // Spurious wakeups are allowed.
       // Throws ISSE("Mutex is not locked by the current thread") if the
       // current thread does not hold this mutex.
       // Throws ISSE("Invalid condition") if `id` was not returned by
       // `newCondition` of this MultiConditionMonitor instance.
       func wait(id: ConditionID, timeout!: Duration.Max): Bool

       // Wakes up a single thread waiting on the specified condition, if any
       // (no particular admission policy implied).
       // Throws ISSE("Mutex is not locked by the current thread") if the
       // current thread does not hold this mutex.
       // Throws ISSE("Invalid condition") if `id` was not returned by
       // `newCondition` of this MultiConditionMonitor instance.
       func notify(id: ConditionID): Unit

       // Wakes up all threads waiting on the specified condition, if any (no
       // particular admission policy implied).
       // Throws ISSE("Mutex is not locked by the current thread") if the
       // current thread does not hold this mutex.
       // Throws ISSE("Invalid condition") if `id` was not returned by
       // `newCondition` of this MultiConditionMonitor instance.
       func notifyAll(id: ConditionID): Unit
    }

  @Description:  Checks that MultiConditionMonitor provides all required
                 methods and throws all necessary exceptions.

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../aux_test_wrong_cond_id.cj

  @Issue:        0006629

*/
import std.time.*

main(): Int64 {

    // Exceptions
    testWrongId()

    let m: Mutex = Mutex()
    let condId:Condition
    synchronized(m) {
        condId = m.condition()
    }

    // wait with timeout
    let fut1 = spawn {
        condId.wait(timeout: Duration.nanosecond * 10)
        return 0xA
    }
    Assert.throws({ => fut1.get() }, check: { e => e is IllegalSynchronizationStateException})

    // wait without timeout
    let fut2 = spawn {
        condId.wait()
        return 0xA
    }
    Assert.throws({ => fut2.get() }, check: { e => e is IllegalSynchronizationStateException})

    // notify
    Assert.throws({ => condId.notify() }, check: { e => e is IllegalSynchronizationStateException})

    // notifyAll
    Assert.throws({ => condId.notifyAll() }, check: { e => e is IllegalSynchronizationStateException})

    return 0
}
