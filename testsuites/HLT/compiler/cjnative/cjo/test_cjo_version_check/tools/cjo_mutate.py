# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# See https://cangjie-lang.cn/pages/LICENSE for license information.

# cjo_mutate.py — CJO 版本检查 fixture 手术工具(真实实现,flatc JSON 往返主路径
#   + 字节级破坏操作,全部用例运行时现场生成,套件不预存任何 .cjo)
# 先例:CHIROpt/ArrayLambda pick_defination.py(套件根共享工具,DEPENDENCE ../x.py)
#
# 用法(与 test_cjo_version_check 各用例头部一致):
#   --patch-cjo <file> --set-cjo-version M.m.p   改写 cjo 的 cjoVersion 三元组
#   --patch-cjo <file> --set-version-string S    改写 cjo 的 version 字符串(产物溯源,同长更稳)
#   --patch-cjo <file> --clear-version-string    删除 version 字符串(诊断报 'unknown' 溯源)
#   --patch-cjo <file> --truncate <N>            截断至前 N 字节(Verifier 结构失败;N 省略=减半)
#   --patch-cjo <file> --corrupt-identifier      头 4 字节改 XXXX(file identifier 非 CJOF)
#   --patch-cjo <file> --random-fill [SEED]      等长随机字节替换全文(固定种子=可复现)
#   --dump-version <file>                        印 "M.m.p <version-string>"(写读闭环断言用)
#   --generate <baseline.cjo> <out.cjo> --set-cjo-version M.m.p [--set-version-string S]
#                                                从基准产物生成命名 fixture(Verifier 必过)
# 实测门禁语义(cjc 1.3.0-alpha.20260920003052,基准 (0,1,0)):
#   接受:minor<=cur 且 major<=cur(含 (0,0,0));拒绝:minor>cur 或 major>cur
#   cjoVersion 是 CjoFormat.fbs 的 inline struct(3 字节,无在场位)→ 无法缺字段;
#   (0,0,0) 即"缺版本"的可实现形态,且被接受(与 version 字符串缺失被拒绝不同)。
# 权威命令 cjo→json: ./flatc -t ./CjoFormat.fbs -- ./<file>.cjo
# 权威命令 json→cjo: ./flatc -b ./CjoFormat.fbs ./<file>.json 产出 <file>.bin,mv 改名为 <file>.cjo
#   flatc 输出 relaxed JSON(键名不带引号,可能带尾逗号);stderr 的 snake_case warning 可忽略
#   flatc 产出名 = 输入 splitext 词干,共享词干的文件会互撞 → 一律复制到唯一临时名再手术
# 分发形态:tools/ 下各平台 flatc 以 zip 入库,首次使用现场解压(见下方 _FLATC_* 一节)。
#   套件资源定位:flatc 与 CjoFormat.fbs 只在本脚本所在目录(即套件内 tools/)查找;
#   不读 CANGJIE_TEST 环境变量,不搜 cwd,不搜 PATH,其他路径一律不进行任何搜索
# 注意:cjoVersion 与 .cachedast 的 HashedPackage.version:string 是两类机制(前者本特性,
#   后者既有 CANGJIE_VERSION 门禁),勿混淆。
import argparse
import os
import random
import re
import shutil
import subprocess
import sys
import tempfile
import zipfile


# flatc 分发:各平台二进制以 zip 入库(包内单个 flatc,命名如 flatc-mac),首次使用现场解压,
#   解压目标固定为 zip 同级目录(即本脚本所在目录),此后直接复用已解压产物;
#   解压失败即报错退出,不退回任何其他路径。
_FLATC_SPECIFIC = {'win': 'flatc-win.exe', 'mac': 'flatc-mac', 'linux': 'flatc-linux'}
_FLATC_GENERIC = {'win': 'flatc.exe', 'mac': 'flatc', 'linux': 'flatc'}
_FLATC_ZIPS = {  # 本平台 zip 候选名(平台名优先,通名兜底)
    'win': ('flatc-win.zip', 'flatc-windows.zip', 'flatc.zip'),
    'mac': ('flatc-mac.zip', 'flatc-macos.zip', 'flatc-darwin.zip', 'flatc.zip'),
    'linux': ('flatc-linux.zip', 'flatc.zip'),
}


def _platform_key():
    if os.name == 'nt':
        return 'win'
    return 'mac' if sys.platform == 'darwin' else 'linux'


def _tools_dir():
    """资源唯一探测目录:本脚本所在目录(即套件内 tools/)。

    flatc/CjoFormat.fbs 只与本脚本同级查找;不读 CANGJIE_TEST 环境变量,
    不搜 cwd,不搜 PATH——其他路径一律不进行任何搜索,避免从他处误取
    版本不一致的工具/描述文件。
    """
    return os.path.dirname(os.path.abspath(__file__))


def locate_tool(name):
    """找 CjoFormat.fbs 等资源:仅本脚本所在目录(tools/),不做其他任何路径搜索。"""
    cand = os.path.join(_tools_dir(), name)
    if os.path.isfile(cand):
        return cand
    raise SystemExit('cjo_mutate.py: cannot locate %s (searched only %s; '
                     '请确认资源与本脚本同目录)' % (name, _tools_dir()))


def locate_flatc():
    """找本平台 flatc:仅本脚本所在目录(tools/)内 专属名二进制 → 本平台 zip
    (首次现场解压一次) → 通名;不做其他任何路径搜索(cwd/PATH 一律不查)。

    专属名优先于通名:避免同目录内他平台 flatc(如 linux 的 flatc)在 mac/linux 被误用;
    zip 命中解压一次后,专属名此后直接命中,不再解包。
    """
    key = _platform_key()
    d = _tools_dir()
    cand = os.path.join(d, _FLATC_SPECIFIC[key])
    if os.path.isfile(cand):
        return cand
    for zname in _FLATC_ZIPS[key]:
        zcand = os.path.join(d, zname)
        if os.path.isfile(zcand):
            return _extract_flatc_zip(zcand)
    cand = os.path.join(d, _FLATC_GENERIC[key])
    if os.path.isfile(cand):
        return cand
    raise SystemExit('cjo_mutate.py: cannot locate flatc for %s (searched only %s; '
                     '请确认本平台 flatc 二进制或 zip 与本脚本同目录)' % (key, d))


def _extract_flatc_zip(zip_path):
    """解包 flatc zip(成员按 basename 平铺)并返回本平台二进制路径。

    解压目标固定为 zip 同级目录(即本脚本所在目录),不落到任何其他路径;
    并发用例同时触发解压时按"已存在且等长则跳过 + 临时名原子替换"防撕裂。
    """
    bases = (_FLATC_SPECIFIC[_platform_key()], _FLATC_GENERIC[_platform_key()])
    outdir = os.path.dirname(os.path.abspath(zip_path))
    try:
        with zipfile.ZipFile(zip_path) as zf:
            for info in zf.infolist():
                if info.is_dir():
                    continue
                base = os.path.basename(info.filename.replace('\\', '/'))
                if not base:
                    continue
                dst = os.path.join(outdir, base)
                if not (os.path.isfile(dst) and os.path.getsize(dst) == info.file_size):
                    tmp_dst = '%s.tmp%d' % (dst, os.getpid())
                    with zf.open(info) as src, open(tmp_dst, 'wb') as fh:
                        shutil.copyfileobj(src, fh)
                    os.replace(tmp_dst, dst)
                if os.name != 'nt' and base in bases:
                    os.chmod(dst, 0o755)  # zip 外部属性不保证保留可执行位
    except (OSError, zipfile.BadZipFile) as exc:
        raise SystemExit('cjo_mutate.py: cannot extract flatc from %s into %s: %s'
                         % (zip_path, outdir, exc))
    for base in bases:  # 解压成功:按候选名认领本平台二进制
        cand = os.path.join(outdir, base)
        if os.path.isfile(cand):
            return cand
    for base in sorted(os.listdir(outdir)):  # 兜底:命名不在候选表(如带架构后缀)
        if not base.startswith('flatc'):
            continue
        if os.name == 'nt':
            if not base.endswith('.exe'):
                continue
        elif '.' in base:
            continue
        cand = os.path.join(outdir, base)
        if os.path.isfile(cand):
            if os.name != 'nt':
                os.chmod(cand, 0o755)
            return cand
    raise SystemExit('cjo_mutate.py: no flatc binary for this platform in %s' % zip_path)


def relaxed_json_to_strict(txt):
    """flatc 的 relaxed JSON → 严格 JSON:键名加引号、去尾逗号。"""
    txt = re.sub(r'([,{\[]\s*)([A-Za-z_][A-Za-z0-9_]*)\s*:', r'\1"\2":', txt)
    txt = re.sub(r',(\s*[}\]])', r'\1', txt)
    return txt


def strict_json_to_relaxed(txt):
    """严格 JSON → relaxed:键名去引号(flatc -b 接受两种,统一回 relaxed 便于二次手术)。"""
    return txt


def flatc_roundtrip(cjo_path, mutate):
    """cjo → json → mutate(json 文本) → bin → 覆写回 cjo。"""
    flatc = locate_flatc()
    fbs = locate_tool('CjoFormat.fbs')
    tmp = tempfile.mkdtemp(prefix='cjo_mutate_')
    try:
        stem = 'probe_%d' % os.getpid()
        probe = os.path.join(tmp, stem + '.cjo')
        shutil.copy(cjo_path, probe)
        r = subprocess.run([flatc, '-t', fbs, '--', probe], cwd=tmp,
                           capture_output=True, text=True, errors='replace')
        if r.returncode != 0:
            raise SystemExit('cjo_mutate.py: flatc -t failed on %s:\n%s'
                             % (cjo_path, (r.stderr or '')[-400:]))
        json_path = os.path.join(tmp, stem + '.json')
        if not os.path.isfile(json_path):
            raise SystemExit('cjo_mutate.py: flatc -t produced no json for %s' % cjo_path)
        txt = open(json_path, encoding='utf-8').read()
        txt = mutate(txt)
        open(json_path, 'w', encoding='utf-8').write(txt)
        r = subprocess.run([flatc, '-b', fbs, stem + '.json'], cwd=tmp,
                           capture_output=True, text=True, errors='replace')
        if r.returncode != 0:
            raise SystemExit('cjo_mutate.py: flatc -b failed:\n%s' % (r.stderr or '')[-400:])
        bin_path = os.path.join(tmp, stem + '.bin')
        if not os.path.isfile(bin_path):
            raise SystemExit('cjo_mutate.py: flatc -b produced no bin')
        shutil.move(bin_path, cjo_path)
    finally:
        shutil.rmtree(tmp, ignore_errors=True)


TRIPLE_RE = re.compile(
    r'cjoVersion: \{\s*major_num: (\d+),\s*minor_num: (\d+),\s*patch_num: (\d+)')
VERSION_STR_RE = re.compile(r'version: "([^"]*)"')


def set_triple(txt, m, mi, p):
    def repl(match):
        return ('cjoVersion: {\n    major_num: %d,\n    minor_num: %d,\n'
                '    patch_num: %d' % (m, mi, p))
    new, n = TRIPLE_RE.subn(repl, txt, count=1)
    if n == 0:
        raise SystemExit('cjo_mutate.py: cjoVersion triple not found in json')
    return new


def read_triple(txt):
    m = TRIPLE_RE.search(txt)
    if not m:
        raise SystemExit('cjo_mutate.py: cjoVersion triple not found in json')
    return (int(m.group(1)), int(m.group(2)), int(m.group(3)))


def byte_ops(path, op, arg=None):
    """字节级破坏操作(Verifier 组):截断/坏 identifier/随机填充。直接改写文件。"""
    raw = open(path, 'rb').read()
    if op == 'truncate':
        n = int(arg) if arg is not None else len(raw) - len(raw) // 2
        raw = raw[:n]
    elif op == 'corrupt-identifier':
        raw = b'XXXX' + raw[4:]
    elif op == 'random-fill':
        rng = random.Random(int(arg) if arg is not None else 42)
        raw = bytes(rng.randrange(256) for _ in range(len(raw)))
    else:
        raise SystemExit('cjo_mutate.py: unknown byte op %s' % op)
    open(path, 'wb').write(raw)
    print('cjo_mutate.py: %s applied to %s' % (op, path))


def main():
    ap = argparse.ArgumentParser(description='CJO version fixture surgery tool')
    ap.add_argument('--patch-cjo', metavar='FILE')
    ap.add_argument('--generate', nargs=2, metavar=('BASE', 'OUT'))
    ap.add_argument('--set-cjo-version', metavar='M.m.p')
    ap.add_argument('--set-version-string', metavar='S')
    ap.add_argument('--clear-version-string', action='store_true')
    ap.add_argument('--truncate', nargs='?', const='', default=None, metavar='N')
    ap.add_argument('--corrupt-identifier', action='store_true')
    ap.add_argument('--random-fill', nargs='?', const='', default=None, metavar='SEED')
    ap.add_argument('--dump-version', metavar='FILE')
    ap.add_argument('--patch-cache', action='store_true',
                    help='兼容保留:实测 .cached 内 <hash>.cjo 的 cjoVersion 不参与门禁,'
                         '本工具不再提供缓存手术;如传入则报错退出(防止空转假绿)')
    args = ap.parse_args()

    if args.patch_cache:
        raise SystemExit('cjo_mutate.py: --patch-cache 已废弃(实测缓存 cjo 不参与版本门禁;'
                         '增量用例改为手术命令行 dep cjo,见用例头部 fixture 说明)')

    # 字节级破坏:不经过 flatc(输入本来就允许是坏结构),直接改文件
    byte_op = None
    if args.truncate is not None:
        byte_op = ('truncate', args.truncate or None)
    elif args.corrupt_identifier:
        byte_op = ('corrupt-identifier', None)
    elif args.random_fill is not None:
        byte_op = ('random-fill', args.random_fill or None)
    if byte_op is not None:
        if not args.patch_cjo:
            ap.error('--truncate/--corrupt-identifier/--random-fill need --patch-cjo FILE')
        byte_ops(args.patch_cjo, byte_op[0], byte_op[1])
        return

    if args.dump_version:
        flatc = locate_flatc()
        fbs = locate_tool('CjoFormat.fbs')
        tmp = tempfile.mkdtemp(prefix='cjo_dump_')
        try:
            probe = os.path.join(tmp, 'dump.cjo')
            shutil.copy(args.dump_version, probe)
            r = subprocess.run([flatc, '-t', fbs, '--', probe], cwd=tmp,
                               capture_output=True, text=True, errors='replace')
            if r.returncode != 0:
                raise SystemExit('cjo_mutate.py: flatc -t failed:\n%s' % (r.stderr or '')[-300:])
            txt = open(os.path.join(tmp, 'dump.json'), encoding='utf-8').read()
        finally:
            shutil.rmtree(tmp, ignore_errors=True)
        tri = read_triple(txt)
        vs = VERSION_STR_RE.search(txt)
        print('%d.%d.%d %s' % (tri[0], tri[1], tri[2], vs.group(1) if vs else '(none)'))
        return

    targets = []
    if args.patch_cjo:
        targets.append(args.patch_cjo)
    if args.generate:
        base, out = args.generate
        shutil.copy(base, out)
        targets.append(out)

    if not targets:
        ap.error('nothing to do: need --patch-cjo FILE or --generate BASE OUT')

    triple = None
    if args.set_cjo_version:
        parts = args.set_cjo_version.split('.')
        if len(parts) != 3:
            ap.error('--set-cjo-version expects M.m.p')
        triple = tuple(int(x) for x in parts)

    for path in targets:
        def mutate(txt):
            txt2 = txt
            if triple is not None:
                txt2 = set_triple(txt2, *triple)
            if args.set_version_string is not None:
                new, n = VERSION_STR_RE.subn('version: "%s"' % args.set_version_string,
                                             txt2, count=1)
                if n == 0:
                    raise SystemExit('cjo_mutate.py: version string not found in json')
                txt2 = new
            if args.clear_version_string:
                new, n = re.subn(r'version: "[^"]*",\s*', '', txt2, count=1)
                if n == 0:
                    raise SystemExit('cjo_mutate.py: version string not found in json')
                txt2 = new
            if txt2 == txt and triple is None and args.set_version_string is None \
                    and not args.clear_version_string:
                raise SystemExit('cjo_mutate.py: no mutation applied to %s' % path)
            return txt2
        flatc_roundtrip(path, mutate)
        print('cjo_mutate.py: patched %s' % path)


if __name__ == '__main__':
    main()
