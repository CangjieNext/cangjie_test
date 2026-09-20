# TC-CJO-WR-macro-independent(组: Manual;执行域: manual)

- 用例意图: 启用/禁用 native backend 两配置导出的 CJO 均含版本字段,交叉导入无差异;版本常量定义不再受 native backend 宏控制(DT 设计明确)
- fixture: 配方见设计文档 test_design.md(位于 talkless/test_designs/lang/cjo_version_check) §四(运行时现场手术,套件零 .cjo 预存)。 本场景变体为构建配置(native backend 宏开/关),非字段篡改。
- 注: tools/ 下 flatc 以 zip 分发(flatc-win.zip / flatc-mac.zip / flatc.zip),人工执行前先解压本平台 zip 至 tools/;跑任一自动化用例时 cjo_mutate.py 也会现场自动解压。
- 判据: cjo_version_check/write_read/write_side/write_macro_independence
- 需求追溯: DT 设计补盲#8(宏无关性);FN-01;版本定义与宏配置解耦回归

宏配置白盒 UT 规格(Manual:双构建配置)

步骤:
  1. 启用 native backend 宏的构建配置编译 pkg 导出 CJO(产物A);
  2. 禁用 native backend 宏的构建配置编译同一 pkg 导出 CJO(产物B);
  3. flatc -t tools/CjoFormat.fbs 分别转 JSON 断言:产物A/产物B 均含 cjoVersion 字段且同为 {0,1,0};
  4. 交叉导入:下游分别消费 A/B/A+B,均无版本诊断(PIPE-0 + scan-not)。
  预言:两种配置均写入版本字段,交叉导入无兼容性差异。