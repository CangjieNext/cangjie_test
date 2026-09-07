# Test Design Brief — std.concurrent ThreadScope

## Document Revision Record

- 2026-09-05: Initial version. Test design rationale for threadscope001-055, structured per the in-house Test Design Reference Manual outline. Derived from std_en concurrent docs, `thread_group.cj` implementation source, and local execution on cjc 1.3.0-alpha.20260905010001 (windows_x64). --Test design session

## 1. Test Object Analysis

### 1.1 Requirement Background

- **Requirement**: The `ThreadScope` structured-concurrency feature of the Cangjie standard library (`std.concurrent`), comprising the package function `threadScope<T, R>(fn: (ThreadGroup<T>) -> R): R` and the class `ThreadGroup<T> <: Iterable<T>` with methods `launch`, `cancelAll`, `iterator`.
- **Delivered specifications** (each one is an assertable contract extracted from the docs):
  1. `threadScope` runs `fn` with a scoped group; before returning it waits for all tasks launched by the group.
  2. Unconsumed task values are discarded at scope exit.
  3. If any unconsumed task result fails, the failure is rethrown while `threadScope` is waiting; the first failure is rethrown, the rest are discarded.
  4. If `fn` itself fails, all launched tasks are cancelled, remaining results are silently drained, and `fn`'s own failure is rethrown.
  5. Each launched task contributes one result; iteration yields results in completion order.
  6. Iterating the group waits for results (blocking reads); `next()` returns `None` when the group is exhausted.
  7. `next()` re-throws the exception or error of a consumed task if that task failed.
  8. `cancelAll` requests cancellation for every launched task and causes subsequently launched tasks to be cancelled as well (sticky semantics).
  9. Cancellation is cooperative: it sets a pending-cancellation flag observable via `Thread.currentThread.hasPendingCancellation`; it never kills a thread.
  10. Exceptions and errors raised by a task are captured, queued, and re-thrown when the result is consumed.
- **Post-violation behavior**: specifications 3/4 define the failure paths precisely; anything outside them (group escaping the scope, concurrent iteration, mixing with raw `spawn`) is explicitly undefined per documentation — a violation there is not accepted as a bug.

### 1.2 Application Scenarios

- Structured fork/join inside one scope: fan out N tasks, consume results, get exception propagation for free.
- Cooperative shutdown: a failure in `fn` triggers cancellation of still-running siblings.
- Type-generic result collection: task results of any type `T`, aggregated into any return type `R`.
- Nesting: inner scopes inside a task of an outer scope, with independent lifecycles.

### 1.3 Structure and Processing Flow

Implementation viewpoint (`stdlib/libs/std/concurrent/thread_group.cj`):

- **ThreadGroup is a result queue plus a cancel switch**:
  - `futures: ArrayList<Future<Unit>>` — handles of all launched tasks;
  - `completed: LinkedBlockingQueue<Result<T>>` — queue of `Ok(T) | Ex(Exception) | Err(Error)`;
  - `unconsumed: AtomicUInt64` — count of queued-but-unconsumed results;
  - `cancelled: Bool` guarded by `mtx: Mutex` — the sticky cancel switch.
- **Processing flow across one `threadScope` call**:
  1. *Execute*: `launch` increments `unconsumed`, spawns the task (wrapped in try/catch that enqueues `Ok/Ex/Err`), records the future, and — if `cancelled` is already set — cancels the new future inside the same critical section (no race window against `cancelAll`).
  2. *Consume*: `iterator().next()` / for-in call `nextResult()`, which blocks on the queue, decrements `unconsumed`, and re-throws `Ex/Err` at the consumption point.
  3. *Finish*: normal path — `waitForAll()` consumes everything (values kept, first failure rethrown, rest discarded) then returns `fn`'s result. Failure path — `cancelAll()` + `silentWaitForAll()` (drain and discard everything) then rethrow `fn`'s exception.
- **Position in the system**: pure user-space scheduling on top of Cangjie threads (`spawn`) and `Future.cancel`; no OS-level or FFI dependencies.

### 1.4 External Interfaces

| Interface | Signature | Function |
|---|---|---|
| `threadScope` | `public func threadScope<T, R>(fn: (ThreadGroup<T>) -> R): R` | Scoped structured-concurrency entry; returns `fn`'s result; rethrows failures per specifications 3/4 |
| `ThreadGroup.launch` | `public func launch(task: () -> T): Unit` | Launches one task on a new thread; returns `Unit` (no handle exposed) |
| `ThreadGroup.cancelAll` | `public func cancelAll(): Unit` | Cancels all launched tasks and makes the group refuse new work (sticky) |
| `ThreadGroup.iterator` | `public func iterator(): Iterator<T>` | Blocking result-consumption iterator; rethrows consumed failures |
| `Thread.currentThread.hasPendingCancellation` | property | Cooperation point a task checks to observe cancellation |

### 1.5 Constraints

- `ThreadGroup<T>` is scoped: it must not escape the `threadScope` closure (undefined behavior otherwise).
- Iteration is not safe for concurrent iteration from multiple threads.
- Cancellation never preempts: a task that never checks `hasPendingCancellation` runs to completion and its success value is indistinguishable from a normal result (`launch` returns `Unit`, no cancel indicator).
- `cancelAll` is sticky and one-way: there is no un-cancel.
- The `Err(Error)` rethrow path cannot be exercised cheaply: `Error` cannot be constructed or subclassed outside the package; the only reachable runtime `Error` is deep-recursion `StackOverflowError`, whose stack-trace capture costs ~9 s per case.
- Only the first failure is rethrown; remaining failures are silently discarded — consumers must not expect aggregation.

### 1.6 Platform Difference Analysis

- All 55 cases were designed and verified on windows_x64 (cjc 1.3.0-alpha.20260905010001, Target x86_64-w64-mingw32). The feature is pure stdlib concurrency on top of the Cangjie thread runtime; no platform-specific API surface exists.
- Timing-based assertions use generous margins (wall-clock thresholds ~5 s vs. sub-second work; 20-110 ms sleep ladders) precisely so that scheduler differences across Linux/macOS/Windows do not change outcomes. Re-running the full suite on other platforms is therefore expected to be equivalent; a platform-specific deviation would itself be a finding.

### 1.7 Trustworthiness Attribute Analysis

#### Reliability & Availability

- The feature is itself a concurrency-reliability building block; reliability of the *test object* is exercised by: result integrity under scale (029: 200 tasks, no loss/duplication/reorder), no-deadlock under self-cancel (046), no-crash under launch/cancelAll races (011), and repeated exhaustion reads returning `None` (037).
- Determinism discipline: all pass/fail outcomes are mechanism-pinned (sleep ladders, atomics, wall-clock bounds), so suite flakiness does not mask product flakiness.

#### Security & Privacy

- No security-relevant surface: no credentials, no I/O, no privilege boundaries. Not applicable beyond verifying that cancellation never leaks onto the caller's thread (034).

#### Resilience

- The failure/cancellation paths (specifications 3/4/8/9) are the resilience core: 12 cases verify failure propagation integrity and 10 cases verify the cancellation matrix. A weakening of these paths (e.g., failures silently swallowed, cancellation becoming preemptive) is caught by paired counterfactual assertions (see §2.1 and §3.2).

## 2. Test Strategy Analysis

### 2.1 Test Focus and Strategy

**Strategy: derive every case from a five-step chain** (the "case-generating machine"; any new case must find its place on this chain):

1. **Extract semantic promises** — every assertable verb-level phrase in the docs becomes a contract; nothing is skipped, "obvious" sentences included.
2. **Restore lifecycle stages** — attach each promise to the timeline (execute → consume → finish). Key insight: failures and cancellations are *events on a timeline*, not instantaneous global switches; the gap between "event happens" and "event is observed" is where all subtle behavior lives.
3. **Pair positive/negative propositions** — for each contract ask both "what if it happens" and "what if it does not". Only-one-direction coverage cannot detect a degenerate implementation that passes the positive case (e.g., 020 "consumed failure does not propagate" vs. 030 "unconsumed failure does propagate"; 004 "failure while fn runs cancels siblings" vs. 009 "failure after fn returns does not interrupt them").
4. **Parameter sweep** — substitute four orthogonal dimensions into each contract: type face (T: String/Bool/Unit/custom class/Option\<Int64\>; R: Unit/Int64/collections), count face (0/1/3-4/200 tasks), source face (task failure vs. fn failure vs. both), timing face (failure before/during/after consumption).
5. **Determinism pinning** — replace luck with mechanism: increasing-sleep ladders pin completion order; `Atomic*` for cross-closure state (Cangjie forbids lambdas capturing mutable locals — a language constraint, hence a uniform style); wall-clock bounds assert concurrency and waiting; exit codes as the sole oracle (HLT convention: no stdout comparison).

**Five lifecycle branches organize the 55 cases (macro view)**:

| Branch | Theme | Cases |
|---|---|---|
| A. Enter scope — scoping & return-value contract | R passthrough (008), true concurrency (027), wait-after-fn-return (028), scale integrity (029), nesting (049) | 5 |
| B. Execute — launch & cancellation requests | `launch` type face (001); `cancelAll` full timing matrix: empty group (021), running (006), pre-set sticky (033), after drain (045), from inside a task (046), idempotent repeat (047); cancel affects only group threads (034); tasks may ignore cancel (048); race tolerance (011) | 10 |
| C. Consume — result queue read protocol | for-in vs. iterator().next() (002/039/051 vs. 012-014/024/032/037); completion order as the only order promise (007/044); blocking semantics (024); failure already queued still reachable (043); iterator/launch interleave (035); dual-iterator relay (036); repeated None after exhaustion (037); multi-round launch-consume (040); empty-group zero iteration (013/051) | 14 |
| D. Failure propagation — exceptions cross three boundaries | task body → queue → consumer → scope caller; iterator-level rethrow (015/019/043); scope-level rethrow (003/018); type+payload fidelity (031/055); runtime-type dispatch (053); first-failure-only rethrow (010/044); siblings not interrupted at failure moment (009); fn's failure wins over task failures (054) | 12 |
| E. Generic face — T and R coverage | T: String (022), Bool (023), custom class (038), Option\<Int64\> (041); R: collection (042); ThreadGroup\<T\> as `Iterable<T>` passed to a generic helper (050) | 6 |

**Three tension lines are the real backbone (meso view)** — cases pair up on both sides of each dilemma:

1. **When does a failure interrupt whom?** Failure does not interrupt siblings at the moment it happens (009: all three siblings still reach their closing `fetchAdd`) → cancellation is requested only while `fn` is still running (004/016) → cancellation is cooperative and ignorable (006/048/033) → interruption happens only at consumption (015/019) → rethrow picks the first failure (010) and `fn`'s own failure wins (026/054).
2. **How much was consumed determines how the scope finishes.** Four consume-progress × finish-path combinations, all covered: fully consumed → clean return; leftover values only → silently discarded (025/039); leftover failure → waiting-phase rethrow (030); `fn` throws → cancel + drain + rethrow `fn`'s original failure (016/026/055). Same failure, consumed-and-handled → gone (020); not consumed → rethrown for you (030).
3. **Promise vs. concurrent reality.** Deterministic contracts, hard-asserted: concurrency (027), waiting (005/028), completion order (007/044), integrity (029/032). Undefined-but-pinned-as-is: races do not crash (011), self-cancel does not deadlock (046) — these are snapshot cases, updated only together with docs. Explicitly untested: group escape, concurrent iteration, raw `spawn` mixing (no assertion is writable for undefined behavior).

### 2.2 Difficulties, Risks and Strategies

| Difficulty / Risk | Strategy |
|---|---|
| Nondeterministic scheduling makes concurrent cases flaky | Mechanism-pinned ordering (sleep ladders), atomic observation points, wall-clock assertions with wide margins, exit-code oracle; acceptance requires 5 stable local runs + 3 green framework rounds |
| Race window between `cancelAll` and `launch` | Read implementation source first (`synchronized(mtx)` on both sides); test the observable contract (011: no crash/hang, CME tolerable) rather than internals |
| `Err(Error)` path untestable at HLT cost | Documented exclusion (§1.5): construction impossible, SOE case ~9 s; implementation shares the queue/rethrow machinery with the `Exception` path; revisit if Error-side logic diverges |
| Undefined behaviors invite "completionism" | Explicitly recorded as out of scope (§1.5); no case written, preventing future false regressions |
| Cangjie language traps skew designs | Known traps encoded as rules: lambdas cannot capture mutable locals → Atomic; `return` inside a lambda returns from the lambda; match arms need identical types; `ArrayList.join()` does not exist; CRLF house style (cjc rejects `\r\r\n` mangling as unknown token) |
| Stale outputs cause false regressions (nested-repo lesson) | Framework runs always from the framework directory with explicit `--test_cfg` basic.cfg (ThreadScope dir has no test.cfg) |

## 3. Detailed Test Case Design

### 3.1 Interface Test Design

Parameter-dimension coverage of the five external interfaces (strategy step 4):

- `threadScope<T, R>` type face: T = String/Bool/custom class/Option\<Int64\> (022/023/038/041), R = Unit/Int64/collection (008/042); both generic parameters varied independently.
- `launch` signature: returns `Unit`, no handle leaks (001).
- `iterator()` exhaustion semantics: repeated `next()` after `None` keeps returning `None` (037); empty-group immediate `None` (013); for-in on empty group executes zero iterations (051).
- Illegal/edge inputs are largely inapplicable (closures and void calls); the edge dimension is expressed as count=0 tasks (013/021/051) and count=200 (029).

### 3.2 Functional Scenario Test Design

Scenario coverage follows the lifecycle flow (branch A-D in §2.1) and the tension-line pairings:

- **Normal-path scenarios**: basic for-in consumption (002/032); completion-order yield (007/044); blocking next (024); interleaved launch-consume (035/040); R passthrough and aggregation (008/042); nesting (049); scale (029).
- **Failure-propagation scenarios** (three boundaries, each pinned): iterator-level rethrow (015/019/043), scope-level rethrow (003/018/030), payload/type fidelity across boundaries (031/055/053), first-failure-only (010), siblings-uninterrupted (009), fn-failure priority (054).
- **Cancellation scenarios** (timing matrix): empty group (021), running task (006), pre-set sticky (033), after drain (045), self-cancel from a task (046), repeated (047), caller-thread immunity (034), ignorable (048), race tolerance (011).
- **Counterfactual pairing discipline**: every scenario exists on both sides of its tension line (§2.1); assertion values are chosen so a degenerate implementation lands on a *different exit code*, not the same timeout or crash (see §3.5 per-case anatomy).

### 3.3 Feature-Coupling Test Design

- Coupling with the **thread runtime** (`spawn`/`Future.cancel`): exercised through every cancellation case (006/033/045/046/047).
- Coupling with **`Iterable<T>` protocol and std.collection**: for-in consumption (002/032/039/051), `ThreadGroup<T>` passed to generic helpers taking `Iterable<T>` (050).
- Coupling with **std.sync / std.time** (Atomic*, MonoTime, sleep): used as assertion infrastructure throughout; also validates the documented interplay of `hasPendingCancellation` with user-side polling loops (004/006/033/048).
- Coupling with **nested structured scopes**: 049 verifies inner/outer group independence.

### 3.4 Reliability/Availability, Security/Privacy, Resilience, Compatibility, Performance, Documentation Test Design

- **Reliability/availability**: scale stress (029: 200 tasks, full integrity check), no-deadlock under self-cancel (046), race tolerance (011), repeated-exhaustion stability (037). No fault injection beyond concurrency races (feature has no I/O or state to corrupt).
- **Security/privacy**: no security surface (§1.7); covered by 034 (cancellation never reaches the caller's thread).
- **Resilience**: the entire D branch + cancellation matrix double as resilience tests (§1.7).
- **Compatibility**: this is a new API; no historical behavior to stay compatible with. Binary/source compatibility is governed by the stdlib release process, out of HLT scope.
- **Performance**: no published performance specification. Wall-clock assertions (027: 4×400 ms tasks finish well under serial 1600 ms; 028: total wait ≥ max task sleep) guard the concurrency/waiting semantics, not performance baselines. If performance specs are later published, a dedicated baseline run is needed.
- **Documentation test**: every case header carries `TEST INTENT` / `DOC REF` / `EXPECT` lines quoting the exact doc sentence under test — the doc itself is thereby kept under continuous executable verification. Sample-verified semantics (3 verify samples in `concurrent_samples/`) are folded into the corresponding cases.

### 3.5 Per-Case Anatomy (five construction elements, dissecting 009)

threadscope009 contract: *after one task fails, the scope's finish path waits out all remaining tasks instead of cancelling them, and the failure is rethrown exactly once*. Four tasks sleep 20/50/80/110 ms and `fetchAdd(1)` an atomic counter on exit; the second task throws after its sleep; `main` catches outside the scope, checks the message, and checks `finishedCount == 4`.

| Element | 009 instance | General rule |
|---|---|---|
| Contract | "failure drains all tasks; rethrow exactly once" | One sentence, "who does what under what condition"; goes into TEST INTENT; if it does not fit one sentence, the contract is not yet understood |
| Timing pin | four tasks, 20/50/80/110 ms sleeps, failing task in the middle | Increasing sleeps pin completion order; failure position is itself an independent variable (mid-failure guarantees siblings are still unfinished when the failure is consumed) |
| Observation point | atomic `fetchAdd(1)` at each task's exit | All cross-task observation state is Atomic — Cangjie forbids lambdas capturing mutable locals (language coercion, uniform style) |
| Counterfactual | a global-kill implementation reaches only `finishedCount == 2`; the `== 4` assertion breaks it | The asserted value must separate "contract holds" from "degenerate semantics" onto different exit codes — never both into timeout/crash |
| Oracle | exit 0 = message correct AND count complete; exit 1 = propagation broken; exit 2 = count incomplete | HLT headers forbid stdout comparison; exit code is the only oracle; all exception paths are try-caught into distinct return values |

**Engineering discipline applied to all 55 cases**: header three lines map to contract/dependency/oracle; 5 stable local runs + 3 green framework rounds before a case counts as landed; no deterministic assertions on undefined behavior (snapshots 046/011 assert only "no crash, no hang, finishes"); CRLF line endings; a failing case is information — during the repair round, five broken legacy cases (012/013/014/020/022) exposed real semantics through their own wrong expectations (e.g., 020's unreachable `result == 5` revealed that a failure interrupts for-in consumption; `finishedCount == 3` revealed that the failing task itself never reaches its epilogue).

## 4. Automation, Networking and Test Environment Analysis

- **Automation**: all cases are HLT LEVEL: 0 executables with `// EXEC: %compiler %cmp_opt %f -o %output` and `// RUN-EXEC: %run %run_opt %output %run_args` headers — fully automated compile-and-run, exit-code oracle, no manual inspection.
- **Test framework**: OpenArkCompiler `cangjie_test_framework` (`main.py <ThreadScope dir> --test_cfg <HLT configs/cjnative/windows_x64-windows_x64/basic.cfg> --progress no_flush_progress --timeout 120`). The ThreadScope directory intentionally carries no `test.cfg`; the explicit config defines `cmp_opt = --error-count-limit=all --diagnostic-format=json --dy-std`.
- **Networking**: none — single-process, local concurrency only.
- **Environment**: windows_x64 workstation, local toolchain `E:\cangjie\bin` (cjc 1.3.0-alpha.20260905010001, cjnative). No containers, no cluster, no external services. Suite runtime is seconds per case; the ~9 s Error-path case was the only environment-cost exclusion (§1.5).
- **Portability note**: all timing margins were sized for cross-platform scheduler variance (§1.6); the suite is expected to run green unmodified on Linux/macOS builds of the same toolchain generation.
