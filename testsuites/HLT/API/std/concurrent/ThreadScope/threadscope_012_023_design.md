# ThreadScope 补充测试设计(threadscope012-023)

依据文档:`cangjie_runtime/stdlib/doc/libs/std_en/concurrent`
- `concurrent_package_api/concurrent_package_funcs.md`(threadScope)
- `concurrent_package_api/concurrent_package_classes.md`(ThreadGroup: launch/cancelAll/iterator)
- `concurrent_samples/`(3 个 verify 样例)

参考已有用例:`cangjie_test/testsuites/HLT/API/std/concurrent/ThreadScope/threadscope001-011`。

## 已有用例覆盖盘点(001-011)

| 用例 | 覆盖点 |
|---|---|
| 001 | launch 返回值类型为 Unit(requireUnit 类型检查) |
| 002 | 多任务 + for-in 消费求和(10+20+30=60) |
| 003 | 任务异常经 scope 重抛( Exception.message 校验) |
| 004 | 任务失败 → 未消费任务收到取消请求(hasPendingCancellation 置位) |
| 005 | scope 等待全部未消费任务完成(finishedCount==3) |
| 006 | 显式 cancelAll → 任务观察到取消并退出 |
| 007 | 结果按完成序产出(延迟倒序 2,3,1) |
| 008 | 无任务时 fn 返回值透传(42) |
| 009 | 失败后 scope drain 全部任务(finishedCount==taskCount) |
| 010 | 多任务全失败,仅首个重抛,全部 drain |
| 011 | ThreadGroup 非线程安全:并发 launch/cancelAll 观察 CME |

## 文档语义 → 缺口映射(新增 012-023)

文档中未覆盖的显式语义:

1. **iterator().next() 显式 API**(iterator() 专节):next 返回 Some(已完成结果)/阻塞等待/重抛失败/耗尽后 None。已有用例只用 for-in,从未直接调 iterator()。
2. **空 group 的 next() 返回 None**:文档"If no unconsumed task results remain, next returns None"。
3. **next() 消费失败结果时重抛**(文档 Exceptions 节,launch() 节"rethrown when the result is consumed" 由 iterator 路径直接验证)。
4. **fn 本身抛异常**(funcs.md 第 2 段):scope 取消全部任务、drain、重抛 fn 的原始异常——与任务失败路径(003/004/009)正交。
5. **Error(非 Exception)重抛**(funcs.md Exceptions 节、iterator() Exceptions 节均列 Error):现有用例全部只用 Exception。
6. **fn 内已消费失败(捕获)→ scope 正常完成**(funcs.md 第 1 段"If any unconsumed task throws ... " 的反命题:已消费且已处理则不传播)。
7. **cancelAll 在空 group 上是 no-op**(cancelAll 节未列任何异常)。
8. **结果值类型多样性**(T 非 Int64):String/Bool 结果消费。

## 用例清单

| 编号 | 覆盖点 | 预期 |
|---|---|---|
| 012 | iterator().next() 取已完成结果,Some(42) | next→Some(42),打印 42 |
| 013 | 空 group(未 launch)next() 返回 None | 打印 "no result" |
| 014 | launch 后全消费,next 二次调用返回 None | 打印 1、2、"no result" |
| 015 | next() 消费到失败任务 → 重抛 IllegalArgumentException | 捕获,message=="task failed" |
| 016 | fn 本身抛异常 → scope 重抛,且长任务被取消(cancel 语义) | 捕获 "stop scope",worker 打印 cancelled |
| 017 | fn 本身抛异常且无任务 → 直接重抛 | 捕获 "fn failed" |
| 018 | 任务抛 Error → scope 重抛 Error | catch Error,message=="task error" |
| 019 | iterator().next() 消费 Error → iterator 层重抛 | 捕获 Error,message=="iter error" |
| 020 | fn 内 for-in 消费并 try-catch 任务异常 → scope 正常完成,剩余任务正常 drain | 返回 0 |
| 021 | cancelAll 在无任务的空 group 上为 no-op | scope 正常返回,exit 0 |
| 022 | String 结果消费与聚合 | 拼接 "hello,world" |
| 023 | Bool 结果消费 | true+false 计数 |

注:016 同时覆盖文档 cancellation_sample 行为(worker 观察 hasPendingCancellation 后返回)。015/019 用 IllegalArgumentException,与文档样例一致。

## 风险与注意

- **本地无法验证**:本地 cjc 1.3.0-alpha.02 无 std.concurrent .cjo(该包为 cangjie_runtime 新增),012-023 需在带 std.concurrent 的目标环境编译运行。
- 全部用例为确定性断言(不依赖调度顺序),016 的 worker 打印依赖取消传播但断言只校验 message,时序不敏感。
- 换行 CRLF,与 001-011 一致;目录结构/头部样式沿用。


## 补充设计(threadscope024-055,2026-09-05 第二轮)

依据同组文档做第二遍缺口分析,经 24 个探针在本地 cjc 1.3.0-alpha.20260905010001 全部实测后落地 32 个新用例。
全部满足:编译+运行 rc=0、各 5 次稳定性复跑、cangjie_test_framework 全量 3 轮 55/55 PASS。

### 新增用例清单

| 编号 | 覆盖点 | 文档依据 |
|---|---|---|
| 024 | iterator() 先于 launch 创建,next() 阻塞等待迟到结果 | iterator() 专节 "current thread blocks until a result is available" |
| 025 | fn 提前 return 后剩余未消费值被隐式 drain 且静默丢弃,scope 仍返回 fn 值 | funcs.md 第 1 段 |
| 026 | fn 中途抛异常:剩余结果(值+失败)一律静默 drain,重抛 fn 原始异常 | funcs.md 第 2 段 |
| 027 | 任务真并发:4×100ms 墙钟 < 400ms | overview "groups of Cangjie threads" |
| 028 | fn 立即返回时 scope 仍等待 300ms 任务完成才返回 | funcs.md "waits for every unconsumed task result" |
| 029 | 200 任务规模:sum 完整性(无丢失/重复) | 压力面 |
| 030 | fn 正常返回但存在未消费失败任务:等待期被 iterator 重抛 | funcs.md 第 1 段(反命题于 020) |
| 031 | 任务异常经 scope 重抛后运行时类型+自定义 payload 保持 | iterator()/launch() 语义 |
| 032 | 值+失败混合全消费:2 Some + 1 throw 精确计数 | iterator() 语义 |
| 033 | cancelAll 先于 launch:合作任务立刻观察 hasPendingCancellation 快速退出 | cancelAll 语义 |
| 034 | cancelAll 不标记 scope 自身线程;组结果仍可消费 | 取消只作用于 launched tasks |
| 035 | 迭代中途再 launch,同一 iterator 继续收到新结果 | 结果队列共享 |
| 036 | 同组两个 iterator 顺序接力消费(非并发) | "concurrent iteration not supported" 的合法面 |
| 037 | 耗尽后 next() 多次返回 None | 014 的重复版 |
| 038 | T=Unit 计数 + T=自定义 class 结果 | T 泛型面 |
| 039 | for-in break 提前退出:剩余 drain,fn 值不变 | Iterable+drain 组合 |
| 040 | 组多轮消费:全 drain 后再 launch 再消费 | 生命周期 |
| 041 | T=Option<Int64>:Some/None 结果分类 | T 泛型面 |
| 042 | R=ArrayList<Int64> 集合结果类型 | R 泛型面 |
| 043 | 失败先入队、iterator 后创建:next() 仍重抛先前失败 | 结果队列非快照 |
| 044 | fail-fast 消费顺序:先完成者先产出(失败也按完成序) | "Results are yielded as threads complete" |
| 045 | 全消费后 cancelAll 为 no-op(021 的 drain 后版) | cancelAll 无异常列表 |
| 046 | 子任务内调 cancelAll 不死锁不崩溃(钉当前容忍行为) | 非线程安全警告的现状行为 |
| 047 | cancelAll 幂等:三次调用+穿插 launch,任务照常完成 | 幂等性 |
| 048 | 任务无视取消请求照常完成、结果可消费 | "A thread is free to ignore cancellation requests" |
| 049 | 嵌套 threadScope:内外组独立 drain、结果聚合 | 禁的是 spawn 不是嵌套 scope |
| 050 | ThreadGroup<T> 以 Iterable 参数传入辅助函数消费 | Iterable 父类型 |
| 051 | 空 group for-in 零次迭代(013 iterator 版的对偶) | Iterable 语义 |
| 052 | 多轮消费且第二轮失败:第一轮值已消费,第二轮失败重抛 | 040+失败组合 |
| 053 | Exception/Error 捕获分派按运行时类型,与 handler 顺序无关 | 异常体系 |
| 054 | fn 失败先于任务失败完成:重抛 fn 原始异常 | funcs.md "rethrows the original failure" |
| 055 | 自定义异常经 fn 抛出后过 cancel+drain 路径,payload 保持 | 031 的 fn 侧 |

### 探针阶段的关键认知(影响断言写法)

1. **lambda 捕获可变局部变量即编译错**("lambda capturing mutable variables needs to be called directly"),
   fn 内需要跨捕获改写的状态一律用 Atomic(Int64/Bool);014/020/044 均为此修正过初稿。
2. **match 各分支类型必须一致**:Some 分支 fetchAdd(v)(Int64)与 None 分支 ()(Unit)无最小公共父类型,
   需让 None 分支也产出同型(fetchAdd(0))或用中间 let 拆开。
3. **StackOverflowError 基线成本 ~9 秒**(错误栈 trace 采集走全栈),SOE 类用例若进套件须单条且放宽 timeout;
   本轮未纳入(Error 构造受限,深递归是唯一通路,9s/条代价过高,见「未纳入」)。
4. **AtomicReference<T> 约束 T <: Object**,String 不满足;c044 改用单 AtomicInt64 outcome 编码全部出口。

### 未纳入(有意取舍)

- **Error 重抛路径**(文档 Exceptions 节列了 Error):Error 不可继承不可构造,唯一通路是深递归 SOE,
  实测单条 ~9s(trace 采集),且行为等价于 Exception 路径(同一队列同一重抛机制,已由 015/019/031 锚定)。
  如未来 cjc 暴露可构造的 Error 或缩短 trace 采集,建议补 1 条(预算 timeout ≥ 60s)。
- **group 逃逸 scope 后的行为**:文档只说 "must not escape",未定义具体异常/UB,不可作为 HLT 断言。
- **并发迭代同一 group**:文档明确不支持,行为未定义,不写确定性断言;036 只覆盖顺序接力。
