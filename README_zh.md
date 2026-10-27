# 仓颉编程语言测试

## 目录结构

```shell
cangjie_test/
|-- Conformance
|   `-- Compiler
|       |-- harness     # Harness 测试框架
|       `-- testsuite   # 仓颉 SPEC 一致性测试套件
`-- testsuites
    |-- HLT             # 仓颉 HLT 测试套件
    |-- LLT             # 仓颉 LLT 测试套件
    `-- support         # 需显式运行的补充回归及测试数据
```

## 仓颉 `SPEC` 一致性测试套件运行指南

[Harness 测试框架](Conformance/Compiler/harness/README_zh.md)

## 仓颉 `HLT` 和 `LLT` 测试套运行指南

[Maple 测试框架](https://gitcode.com/Cangjie/cangjie_test_framework/blob/main/README_zh.md)

## 补充回归测试

[aspect_cj 驱动与规则回归](testsuites/support/aspect_cj_driver/README.md)需要匹配的编译器和 stdx 构建。
这些脚本需显式运行，其测试数据不是独立的 Maple 用例。

