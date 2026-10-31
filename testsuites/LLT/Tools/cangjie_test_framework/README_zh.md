# 测试框架命令行回归测试

[English](README.md)

这些测试针对独立检出的
[`cangjie_test_framework`](https://atomgit.com/Cangjie/cangjie_test_framework)
仓库中的 `maple_test/compare.py`。比较工具的生产实现仍放在该框架仓库。

## 依赖与执行

- Python 3.7 或更新版本及其标准库。
- 本地检出的 `cangjie_test` 和 `cangjie_test_framework` 两个仓库。
- 本脚本不依赖仓颉 SDK、外部 shell 工具或第三方 Python 包。

在 **`cangjie_test` 仓库根目录**执行以下命令；此示例中两个仓库为同级目录：

```shell
python testsuites/LLT/Tools/cangjie_test_framework/test_compare_object.py --framework ../cangjie_test_framework -v
```

`--framework` 为必填参数，值为被测框架仓库的根目录。目录布局不同时，
将其替换为实际检出路径；路径含空格时需加引号。该目录中缺少
`maple_test/compare.py` 时，脚本报告参数错误并以 2 退出。`-v` 开启详细的 unittest 输出。

脚本使用同一个 Python 解释器启动比较工具，在临时目录生成 UTF-8 测试文件，
执行结束后清理临时文件。子进程的 `PYTHONIOENCODING` 由脚本设为 `utf-8`，
调用者无需预先设置环境变量。所有场景通过时输出 `OK`，退出码为 0；
断言失败时返回非零退出码。

这是独立的框架回归测试入口，尚未登记到默认 HLT/LLT 测试列表中；
检查框架变更时需显式运行上述命令。

## 覆盖行为

一个 unittest 测试方法执行以下七个子进程场景：

| 输入 | 预期工具结果 |
| --- | --- |
| 省略 `--compare_object` | 读取标准输入，匹配时以 0 退出 |
| UTF-8 文件且路径含空格 | 读取文件，匹配时以 0 退出 |
| `--compare_object` 不带值 | 读取标准输入，匹配时以 0 退出 |
| `--compare_object -` | 读取标准输入，匹配时以 0 退出 |
| 标准输入内容不匹配 | `[Compare Fail]`，退出码 1 |
| 文件不存在 | 参数错误，退出码 2，无 traceback |
| 文件不匹配但标准输入匹配 | `[Compare Fail]`，退出码 1，确认优先使用文件 |

测试同时校验退出码、输出标识，并检查是否出现意外的 traceback。
