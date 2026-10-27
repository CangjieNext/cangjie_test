# aspect_cj 独立回归测试（Linux/cjnative）

本目录归属 `cangjie_test`，保存规则、驱动、CHIR 快照的测试脚本、测试插件和输入数据。它位于 `testsuites/support`，避免把缺少 Maple 指令的辅助 `.cj` 文件误识别为 LLT/HLT 独立用例。本目录脚本需显式运行，不会仅因迁入测试仓就自动加入门禁；正式 LLT/HLT 用例及测试清单保持在原位置。

生产库、Collector/Weaver 和构建驱动由配套 `cangjie_stdx` 提供。使用匹配的编译器和 stdx 产物；需要读取实现源码的测试必须显式传入源码位置，不假定两个仓库互为兄弟目录，也不复制生产实现到测试仓。所有命令从本仓库根目录运行，先设置绝对路径：

```sh
export CANGJIE_HOME=/absolute/path/to/matching/cangjie
STDX_SOURCE=/absolute/path/to/cangjie_stdx
STDX_BUILD=/absolute/path/to/matching/stdx-build
STDX_DIR=/absolute/path/to/installed/dynamic/stdx
DRIVER=/absolute/path/to/installed/bin/aspect-cj-driver
```

端到端测试：

```sh
python3 testsuites/support/aspect_cj_driver/smoke.py \
    --compiler /absolute/path/to/matching/cjc \
    --stdx-directory "$STDX_DIR" \
    --driver "$DRIVER"
```

测试会保留并打印临时工作目录，覆盖跨包调用与参数快照、AND/OR/NOT、共享规则去重、空注解取反、字面量字符串拼接、命名 `const func` 字段、解析后注解身份/别名/同短名、复杂业务注解字段、非法规则载体、旧新 Entry/Exit 同时织入、旧 Replace 冲突、来源兼目标、真实依赖环、零命中不产生假环及收集/预检/最终链接三个失败屏障。另覆盖最终库链接的正逆序及多应用、源声明接口不一致、模块/报告/最终输出篡改拒绝，以及 v2 预编译依赖的真实编译和错误闭包拒绝。它使用配套工具链的真实编译和运行结果，不以模拟的 `.annoinfo` 文件代替正式 Collector。

泛型候选和异常传播另用一个仅用于测试的同包插件验证：

```sh
python3 testsuites/support/aspect_cj_driver/semantic_smoke.py \
    --compiler /absolute/path/to/matching/cjc \
    --stdx-directory "$STDX_DIR"
```

该脚本在默认及 `-O2` 下检查泛型函数、泛型类实例体的计划数和运行次数，以及 Entry/业务/Exit 异常、内部捕获、递归和重复织入拒绝。生产驱动仍只装载正式的 Collector 或 Weaver 插件，不使用测试插件。

元数据读取、会话路径约束和旧版织入限额另有真实编译测试：

```sh
python3 testsuites/support/aspect_cj_driver/hardening_smoke.py \
    --compiler /absolute/path/to/matching/cjc \
    --stdx-directory "$STDX_DIR"
```

测试覆盖会话内文件/别名、会话外同名前缀目录、父目录穿越、越界符号链接、8 MiB 文件读取边界、普通文件检查，以及 legacy 字段/记录/文件超限和截断元数据。仅用于 Linux 验证，不需要网络；所有输入在独立临时目录生成并清理。旧式单个目标编译动作的元数据合计上限为 8 MiB、8192 条记录，单字段上限 65536 字节；超限是编译错误而不是静默跳过织入。

SDK 目录摘要另有直接编译生产驱动源码的默认/O2 回归：

```sh
python3 testsuites/support/aspect_cj_driver/toolchain_digest_smoke.py \
    --driver-source "$STDX_SOURCE/build/aspect_cj_driver/main.cj" \
    --compiler /absolute/path/to/matching/cjc \
    --stdx-directory "$STDX_DIR"
```

该测试覆盖嵌套文件变更/恢复、目录及文件别名、外部链接目标内容变更、链接重定向、祖先目录环、断链、FIFO 和非目录根输入；只在独立临时目录创建测试数据，不修改 SDK。正式 LLT `rule_final_library_linking.cj` 还通过临时 SDK 链接布局验证真实构建、最终库链接及接口不一致拒绝。

规则元数据的并发 GC 与副本隔离另有独立回归：

```sh
python3 testsuites/support/aspect_cj_driver/wire_gc_smoke.py \
    --driver-source "$STDX_SOURCE/build/aspect_cj_driver/main.cj" \
    --compiler /absolute/path/to/matching/cjc \
    --stdx-directory "$STDX_DIR"
```

该脚本直接编译生产驱动源码，仅替换测试入口。默认及 `-O2` 分别真实收集、织入并运行包含 R/C/A/L 的混合切面；随后在 64 MiB 堆下并发请求 GC，完成 2000 轮完整编码/解码比对，并检查输入数组、返回字段和记录副本隔离。它保留临时目录及逐阶段日志，超时、异常或崩溃均失败，不自动重试。输出中的 `gcCalls` 是 GC API 调用次数，不等于运行时完成的独立回收次数。配套 cangjie_test 中的 `rule_wire_gc_whitebox.cj` 通过正式 Linux/CJNATIVE LLT 入口检查同类内核行为；此 Python 脚本本身仍需独立运行。

规则内核与 CHIR 快照的可复跑单元测试位于 `testsuites/support/aspect_cj_driver`。快照测试需要同版本 stdx 构建的 CHIR 源码、对应 schema 生成文件、模块目录和 `flatbuffers.a`；四项参数同时提供时运行快照测试，否则只运行规则内核默认及 `-O2`。脚本不会误用源码目录中遗留的旧生成文件：

```sh
python3 testsuites/support/aspect_cj_driver/unit_smoke.py \
    --stdx-source-dir "$STDX_SOURCE" \
    --compiler /absolute/path/to/matching/cjc \
    --stdx-directory "$STDX_DIR" \
    --chir-source-dir "$STDX_SOURCE/src/stdx/chir" \
    --chir-generated-file "$STDX_BUILD/build_temp/build/StdxChirFormat_generated.cj" \
    --modules-directory "$STDX_BUILD/build_temp/build/modules/linux_x86_64_cjnative" \
    --flatbuffers-archive "$STDX_BUILD/build_temp/build/modules/linux_x86_64_cjnative/flatbuffers.a"
```

CMake 增量构建依赖可独立检查：

```sh
python3 testsuites/support/aspect_cj_driver/cmake_dependency_smoke.py \
    --stdx-source-dir "$STDX_SOURCE"
```

该检查需要 Linux、Python 3、CMake、Ninja 和 Make。它在独立临时目录中加载实际驱动构建规则，用模拟编译器和包产物验证依赖变更后的重建、无变更构建及安装；不修改 SDK，也不替代上述真实仓颉编译与运行测试。
