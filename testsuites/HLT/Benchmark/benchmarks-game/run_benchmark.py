#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


"""
Benchmarks Game test script: measure cj / Java runtime, memory, CPU.
Uses psutil to sample process + all children.

CSV columns:
  case_name, language, cpu.rss, vms, shared, text, lib, data, dirty, uss, pss, swap,
  cost_time, cpu_load, rss_max(byte), rss_integral(byte)
"""

import csv
import os
import sys
import time
import shutil
import subprocess
import psutil
from pathlib import Path
from collections import defaultdict

# ============== Config (override via env vars) ==============
# Windows default; on Linux set BENCH_PROGRAMS_DIR=/home/user/bench-game/programs
_DEFAULT_PROGRAMS_DIR = r"C:\cangjie_0916\cangjie_test\testsuites\HLT\Benchmark\benchmarks-game\programs"
PROGRAMS_DIR = Path(os.environ.get("BENCH_PROGRAMS_DIR", _DEFAULT_PROGRAMS_DIR))
OUT_DIR      = PROGRAMS_DIR / "bench_results"
CSV_PATH     = OUT_DIR / "benchmark_results.csv"
DETAIL_PATH  = OUT_DIR / "benchmark_detail.csv"
SUMMARY_PATH = OUT_DIR / "benchmark_summary.csv"
STDIN_FILE   = OUT_DIR / "knucleotide_revcomp_input.txt"
BUILD_DIR    = OUT_DIR / "build"

REPEAT        = int(os.environ.get("BENCH_REPEAT", 3))
CASE_INTERVAL = float(os.environ.get("BENCH_CASE_INTERVAL", 0.1))
STDIN_N       = int(os.environ.get("BENCH_STDIN_N", 25000000))

# Cangjie envsetup.sh path (Linux). If set, its PATH/LD_LIBRARY_PATH/etc are
# sourced and injected into cj compile/run subprocesses.
# Example: BENCH_CJ_ENVSCRIPT=/path/to/cangjie/envsetup.sh
CJ_ENVSCRIPT = os.environ.get("BENCH_CJ_ENVSCRIPT", "").strip()

PROG_ARGS = {
    "fasta":        "50000000",
    "nbody":        "50000000",
    "spectralnorm": "55000",
    "mandelbrot":   "50000",
    "knucleotide":  "",
    "revcomp":      "",
}
NEED_STDIN = {"knucleotide", "revcomp"}

# Case filter: comma-separated list of program names to run (default: all)
# Examples: BENCH_CASES=fasta  or  BENCH_CASES=fasta,nbody  or command-line arg
_cases_env = os.environ.get("BENCH_CASES", "").strip()
_cases_arg = sys.argv[1] if len(sys.argv) > 1 else ""
_cases_str = _cases_arg or _cases_env
ALL_CASES = list(PROG_ARGS.keys()) if not _cases_str else [c.strip() for c in _cases_str.split(",") if c.strip()]
# Validate
ALL_CASES = [c for c in ALL_CASES if c in PROG_ARGS]
if not ALL_CASES:
    print(f"ERROR: no valid cases. Available: {list(PROG_ARGS.keys())}")
    sys.exit(1)

# Show effective config at startup
def _show_config():
    log(f"PROGRAMS_DIR  = {PROGRAMS_DIR}")
    log(f"OUT_DIR       = {OUT_DIR}")
    log(f"CSV_PATH      = {CSV_PATH}")
    log(f"REPEAT        = {REPEAT}")
    log(f"CASE_INTERVAL = {CASE_INTERVAL}s")
    log(f"STDIN_N       = {STDIN_N}")
    log(f"CASES         = {ALL_CASES}")

# Memory fields from memory_full_info()
MEM_FIELDS = ["rss", "vms", "shared", "text", "lib", "data", "dirty", "uss", "pss", "swap"]

# CSV column order with units in header
CSV_COLUMNS = [
    "case_name", "language",
    "cpu(%)", "rss(byte)", "vms(byte)", "shared(byte)", "text(byte)", "lib(byte)",
    "data(byte)", "dirty(byte)", "uss(byte)", "pss(byte)", "swap(byte)",
    "cost_time(s)", "cpu_load(%)",
    "rss_max(byte)", "rss_integral(byte)",
]

# Summary CSV: avg + peak for each metric (Excel-friendly, ~50 bytes per row)
SUMMARY_COLUMNS = [
    "case_name", "language",
    "cpu_avg(%)", "cpu_peak(%)",
    "rss_avg(byte)", "rss_peak(byte)",
    "vms_avg(byte)", "vms_peak(byte)",
    "shared_avg(byte)", "shared_peak(byte)",
    "text_avg(byte)", "text_peak(byte)",
    "lib_avg(byte)", "lib_peak(byte)",
    "data_avg(byte)", "data_peak(byte)",
    "dirty_avg(byte)", "dirty_peak(byte)",
    "uss_avg(byte)", "uss_peak(byte)",
    "pss_avg(byte)", "pss_peak(byte)",
    "swap_avg(byte)", "swap_peak(byte)",
    "cost_time(s)", "cpu_load(%)",
    "rss_max(byte)", "rss_integral(byte)",
]


def log(msg):
    ts = time.strftime("%H:%M:%S")
    print(f"[{ts}] {msg}", flush=True)


def which(cmd):
    return shutil.which(cmd) is not None


def _load_cj_env():
    """
    If CJ_ENVSCRIPT is set, source it in bash and capture the resulting env
    (PATH, LD_LIBRARY_PATH, etc.) to inject into cj subprocesses.
    Returns a dict of extra env vars (empty dict if not configured).
    """
    if not CJ_ENVSCRIPT:
        return {}
    if not os.path.exists(CJ_ENVSCRIPT):
        log(f"WARNING: BENCH_CJ_ENVSCRIPT not found: {CJ_ENVSCRIPT}")
        return {}
    # Source the script in bash and print the resulting env as KEY=VAL lines
    cmd = f"source {CJ_ENVSCRIPT} >/dev/null 2>&1 && env"
    try:
        r = subprocess.run(["bash", "-c", cmd], capture_output=True, text=True, timeout=30)
        if r.returncode != 0:
            log(f"WARNING: failed to source {CJ_ENVSCRIPT}: {r.stderr[:200]}")
            return {}
        extra = {}
        for line in r.stdout.splitlines():
            if "=" in line:
                k, _, v = line.partition("=")
                extra[k] = v
        log(f"envsetup sourced: {CJ_ENVSCRIPT} ({len(extra)} vars)")
        return extra
    except Exception as e:
        log(f"WARNING: envsetup source error: {e}")
        return {}


# Load once at startup
CJ_EXTRA_ENV = _load_cj_env()


# ============== Core: get_memory ==============
def get_memory(process, case_interval=0.1, case_timeout=None):
    """
    Monitor process and all its children's CPU and memory until exit or timeout.

    Args:
        process: psutil.Process (parent)
        case_interval: sampling interval in seconds
        case_timeout: timeout in seconds, None = no timeout

    Returns:
        dict with keys:
          wall_time_ms, samples,
          cpu_load (avg CPU%, parent + children accumulated),
          <field>_avg for each in MEM_FIELDS (bytes, parent + children),
          rss_max (peak RSS in bytes, parent + children),
          rss_integral (RSS time integral = sum(rss[i] * interval), in byte*seconds),
    """
    mem_samples = {f: [] for f in MEM_FIELDS}
    cpu_samples = []
    rss_raw = []  # for rss_max and rss_integral

    start_time = time.time()

    # Prime cpu_percent baseline (first call returns 0.0)
    try:
        process.cpu_percent()
    except (psutil.NoSuchProcess, psutil.AccessDenied):
        pass

    while True:
        # Check process alive
        try:
            if not process.is_running():
                break
            if process.status() == psutil.STATUS_ZOMBIE:
                break
        except (psutil.NoSuchProcess, psutil.AccessDenied):
            break

        loop_start = time.time()

        # Check timeout
        if case_timeout is not None and (loop_start - start_time) > case_timeout:
            break

        try:
            children = process.children(recursive=True)

            # --- Parent memory ---
            try:
                parent_mem = process.memory_full_info()
                for f in MEM_FIELDS:
                    val = getattr(parent_mem, f, 0) or 0
                    mem_samples[f].append(val)
            except (psutil.NoSuchProcess, psutil.AccessDenied):
                for f in MEM_FIELDS:
                    mem_samples[f].append(0)

            # --- Parent CPU ---
            if children:
                parent_cpu = process.cpu_percent()
            else:
                parent_cpu = process.cpu_percent(interval=case_interval)

            cpu_samples.append(parent_cpu)

            # --- Children: accumulate into parent's last element ---
            for child in children:
                try:
                    child_mem = child.memory_full_info()
                    for f in MEM_FIELDS:
                        c_val = getattr(child_mem, f, 0) or 0
                        if mem_samples[f]:
                            mem_samples[f][-1] += c_val
                except (psutil.NoSuchProcess, psutil.AccessDenied):
                    pass

                try:
                    child_cpu = child.cpu_percent()
                    if cpu_samples:
                        cpu_samples[-1] += child_cpu
                except (psutil.NoSuchProcess, psutil.AccessDenied):
                    pass

        except (psutil.NoSuchProcess, psutil.AccessDenied):
            break

        # Sleep only if we used non-blocking cpu_percent
        if children:
            elapsed = time.time() - loop_start
            sleep_time = max(0, case_interval - elapsed)
            if sleep_time > 0:
                time.sleep(sleep_time)

    end_time = time.time()
    wall_time_s = end_time - start_time
    wall_time_ms = round(wall_time_s * 1000)

    rss_raw = mem_samples["rss"]  # list of RSS samples (parent + children)

    result = {
        "wall_time_ms": wall_time_ms,
        "samples": len(cpu_samples),
        "cpu": cpu_samples,                       # list of CPU% samples (parent + children)
    }
    # Each memory field is the raw sample list (parent + children accumulated)
    for f in MEM_FIELDS:
        result[f] = mem_samples[f]                 # list of bytes samples

    # cpu_load: CPU time integral = sum(cpu_pct[i] * interval), in pct*seconds
    if cpu_samples:
        result["cpu_load"] = round(sum(cpu_samples) * case_interval, 2)
    else:
        result["cpu_load"] = 0

    # rss_max: peak RSS in bytes
    result["rss_max"] = max(rss_raw) if rss_raw else 0

    # rss_integral: sum(rss[i] * interval) in byte*seconds
    result["rss_integral"] = round(sum(rss_raw) * case_interval) if rss_raw else 0

    return result


# ============== Run one benchmark ==============
def run_bench(exe, args, stdin_path=None, lang="", prog="", run_idx=1):
    out_file = OUT_DIR / f"{lang}_{prog}_run{run_idx}.out"
    err_file = OUT_DIR / f"{lang}_{prog}_run{run_idx}.err"

    stdin_fh = None
    if stdin_path and Path(stdin_path).exists():
        stdin_fh = open(stdin_path, "rb")

    # Set cj heap/stack env (cj programs need large heap)
    env = os.environ.copy()
    env.update(CJ_EXTRA_ENV)
    if lang == "cj":
        env["cjHeapSize"] = "1gb"
        env["cjStackSize"] = "64mb"

    try:
        proc = subprocess.Popen(
            [exe] + (args.split() if args else []),
            stdin=stdin_fh,
            stdout=open(out_file, "wb"),
            stderr=open(err_file, "wb"),
            env=env,
        )
    except Exception as e:
        log(f"    launch failed: {e}")
        if stdin_fh: stdin_fh.close()
        return None

    p = psutil.Process(proc.pid)
    r = get_memory(p, case_interval=CASE_INTERVAL)

    proc.wait()
    if stdin_fh: stdin_fh.close()

    r["exit_code"] = proc.returncode
    r["status"] = "OK" if proc.returncode == 0 else f"EXIT={proc.returncode}"
    return r


# ============== Generate stdin data (fasta algorithm) ==============
def generate_fasta_output(n, out_path):
    IM, IA, IC = 139968, 3877, 29573
    last = [42]

    def gen_random(maxv):
        last[0] = (last[0] * IA + IC) % IM
        return maxv * last[0] / IM

    iub = [
        ('a', 0.27), ('c', 0.12), ('g', 0.12), ('t', 0.27),
        ('B', 0.02), ('D', 0.02), ('H', 0.02), ('K', 0.02),
        ('M', 0.02), ('N', 0.02), ('R', 0.02), ('S', 0.02),
        ('V', 0.02), ('W', 0.02), ('Y', 0.02),
    ]
    homosapiens = [
        ('a', 0.3029549426680),
        ('c', 0.1979883004921),
        ('g', 0.1975473066391),
        ('t', 0.3015094502008),
    ]

    def make_cumulative(genelist):
        cp = 0.0
        out = []
        for c, p in genelist:
            cp += p
            out.append((c, cp))
        return out

    iub_cum = make_cumulative(iub)
    homo_cum = make_cumulative(homosapiens)

    alu = (
        "GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGG"
        "GAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGA"
        "CCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAAT"
        "ACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCA"
        "GCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGG"
        "AGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCC"
        "AGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA"
    )

    WIDTH = 60

    def select_random(genelist):
        r = gen_random(1.0)
        if r < genelist[0][1]:
            return genelist[0][0]
        lo, hi = 0, len(genelist) - 1
        while hi > lo + 1:
            mid = (hi + lo) // 2
            if r < genelist[mid][1]:
                hi = mid
            else:
                lo = mid
        return genelist[hi][0]

    def make_repeat_fasta(id_str, desc, s, count, fh):
        fh.write(f">{id_str} {desc}\n")
        todo = count
        k = 0
        kn = len(s)
        while todo > 0:
            m = min(todo, WIDTH)
            while m >= kn - k:
                fh.write(s[k:])
                m -= kn - k
                k = 0
            fh.write(s[k:k+m] + "\n")
            k += m
            todo -= WIDTH

    def make_random_fasta(id_str, desc, genelist, count, fh):
        fh.write(f">{id_str} {desc}\n")
        todo = count
        while todo > 0:
            m = min(todo, WIDTH)
            line = "".join(select_random(genelist) for _ in range(m))
            fh.write(line + "\n")
            todo -= WIDTH

    with open(out_path, "w") as fh:
        make_repeat_fasta("ONE", "Homo sapiens alu", alu, n * 2, fh)
        make_random_fasta("TWO", "IUB ambiguity codes", iub_cum, n * 3, fh)
        make_random_fasta("THREE", "Homo sapiens frequency", homo_cum, n * 5, fh)


# ============== Main ==============
def main():
    _show_config()
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    BUILD_DIR.mkdir(parents=True, exist_ok=True)

    has_cjc  = which("cjc")
    has_java = which("java") and which("javac")
    cores = psutil.cpu_count(logical=True)

    log(f"cjc available:  {has_cjc}")
    log(f"java available: {has_java}")
    log(f"CPU cores:      {cores}")

    # --- Compile phase ---
    cj_bin = {}
    java_bin = {}

    if has_cjc:
        log("=== Compiling .cj ===")
        compile_env = os.environ.copy()
        compile_env.update(CJ_EXTRA_ENV)
        for prog in ALL_CASES:
            src = PROGRAMS_DIR / prog / f"{prog}.cj"
            if not src.exists():
                log(f"  skip {prog} (no .cj)"); continue
            exe = BUILD_DIR / f"{prog}_cj.exe"
            log(f"  compiling {prog}.cj")
            try:
                r = subprocess.run(
                    ["cjc", str(src), "-O2", "-Woff=all", "-o", str(exe)],
                    capture_output=True, text=True, timeout=120, env=compile_env
                )
                if exe.exists():
                    cj_bin[prog] = str(exe)
                    log(f"    OK -> {exe.name}")
                else:
                    log(f"    FAIL: {r.stderr[:200]}")
            except Exception as e:
                log(f"    FAIL: {e}")

    if has_java:
        log("=== Compiling .java ===")
        # Download fastutil jar if any java source imports it.unimi.dsi.fastutil
        lib_dir = OUT_DIR / "lib"
        lib_dir.mkdir(parents=True, exist_ok=True)
        fastutil_jar = lib_dir / "fastutil-8.5.15.jar"
        need_fastutil = False
        for prog in ALL_CASES:
            src = PROGRAMS_DIR / prog / f"{prog}.java"
            if src.exists():
                txt = src.read_text(encoding="utf-8", errors="ignore")
                if "it.unimi.dsi.fastutil" in txt:
                    need_fastutil = True
        if need_fastutil and not fastutil_jar.exists():
            log("  downloading fastutil jar...")
            import urllib.request
            import ssl
            url = "https://repo1.maven.org/maven2/it/unimi/dsi/fastutil/8.5.15/fastutil-8.5.15.jar"
            try:
                # Try normal download first
                try:
                    urllib.request.urlretrieve(url, str(fastutil_jar))
                except Exception:
                    # Fallback: ignore SSL verification (intranet / outdated CA)
                    ctx = ssl.create_default_context()
                    ctx.check_hostname = False
                    ctx.verify_mode = ssl.CERT_NONE
                    with urllib.request.urlopen(url, context=ctx) as resp, \
                         open(str(fastutil_jar), "wb") as f:
                        f.write(resp.read())
                log(f"    OK -> {fastutil_jar.name} ({fastutil_jar.stat().st_size // 1024 // 1024} MB)")
            except Exception as e:
                log(f"    FAIL download fastutil: {e}")
                log(f"    Manual fallback: wget --no-check-certificate -O {fastutil_jar} {url}")
        java_cp = str(BUILD_DIR)
        if fastutil_jar.exists():
            java_cp = f"{BUILD_DIR}{os.pathsep}{fastutil_jar}"

        for prog in ALL_CASES:
            src = PROGRAMS_DIR / prog / f"{prog}.java"
            if not src.exists():
                log(f"  skip {prog} (no .java)"); continue
            log(f"  compiling {prog}.java")
            try:
                cmd = ["javac", "-cp", java_cp, "-d", str(BUILD_DIR), str(src)]
                r = subprocess.run(cmd, capture_output=True, text=True, timeout=120)
                if r.returncode == 0:
                    java_bin[prog] = java_cp
                    log(f"    OK -> {prog}.class")
                else:
                    log(f"    FAIL: {r.stderr[:200]}")
            except Exception as e:
                log(f"    FAIL: {e}")

    # --- Generate stdin data ---
    stdin_ready = False
    if STDIN_FILE.exists() and STDIN_FILE.stat().st_size > 1_000_000:
        log(f"stdin data exists: {STDIN_FILE} ({STDIN_FILE.stat().st_size // 1024 // 1024} MB)")
        stdin_ready = True
    else:
        log(f"=== Generating stdin data (fasta {STDIN_N}) ===")
        try:
            generate_fasta_output(STDIN_N, str(STDIN_FILE))
            sz = STDIN_FILE.stat().st_size / 1024 / 1024
            log(f"  OK -> {STDIN_FILE.name} ({sz:.1f} MB)")
            stdin_ready = True
        except Exception as e:
            log(f"  FAIL: {e}")

    # --- Benchmark phase ---
    results = []

    def do_bench(lang, bin_map, run_exe_builder):
        for prog in ALL_CASES:
            if prog not in bin_map:
                log(f"  [{lang}] skip {prog} (not compiled)"); continue
            arg_val = PROG_ARGS[prog]
            stdin = ""
            if prog in NEED_STDIN:
                if not stdin_ready:
                    log(f"  [{lang}] skip {prog} (no stdin)"); continue
                stdin = str(STDIN_FILE)
            for i in range(1, REPEAT + 1):
                log(f"  [{lang}] {prog} run #{i}")
                exe, args = run_exe_builder(prog, arg_val, bin_map)
                try:
                    r = run_bench(exe, args, stdin if stdin else None,
                                  lang=lang, prog=prog, run_idx=i)
                except Exception as e:
                    r = None
                    log(f"    ERR: {e}")
                if r is None:
                    r = {"wall_time_ms": 0, "samples": 0, "cpu_load": 0,
                         "exit_code": -1, "status": "LAUNCH_FAIL",
                         "rss_max": 0, "rss_integral": 0, "cpu": []}
                    for f in MEM_FIELDS:
                        r[f] = []

                wall_ms = r["wall_time_ms"]
                wall_s = round(wall_ms / 1000, 3)
                rss_max_mb = r["rss_max"] / 1024 / 1024
                log(f"    {wall_s}s  rssMax={rss_max_mb:.1f}MB  "
                    f"cpuLoad={r['cpu_load']}%  [{r['status']}]")

                # Serialize list fields to semicolon-separated string
                # (use ";" not "," to avoid Excel misinterpreting as a single huge number)
                def ser(lst):
                    return ";".join(str(round(x, 2)) for x in lst) if lst else ""

                row = {
                    "case_name":   prog,
                    "language":    lang,
                    "cpu(%)":           ser(r["cpu"]),
                    "rss(byte)":        ser(r["rss"]),
                    "vms(byte)":        ser(r["vms"]),
                    "shared(byte)":     ser(r["shared"]),
                    "text(byte)":       ser(r["text"]),
                    "lib(byte)":        ser(r["lib"]),
                    "data(byte)":       ser(r["data"]),
                    "dirty(byte)":      ser(r["dirty"]),
                    "uss(byte)":        ser(r["uss"]),
                    "pss(byte)":        ser(r["pss"]),
                    "swap(byte)":       ser(r["swap"]),
                    "cost_time(s)":     wall_s,
                    "cpu_load(%)":      r["cpu_load"],
                    "rss_max(byte)":     r["rss_max"],
                    "rss_integral(byte)": r["rss_integral"],
                }
                results.append(row)

    if cj_bin:
        log("=== Testing cj ===")
        def cj_builder(prog, arg_val, bm):
            return bm[prog], arg_val
        do_bench("cj", cj_bin, cj_builder)

    if java_bin:
        log("=== Testing java ===")
        java_opts = os.environ.get("BENCH_JAVA_OPTS", "-Xmx16g -Xss64m")
        log(f"JAVA_OPTS: {java_opts}")
        def java_builder(prog, arg_val, bm):
            exe = "java"
            args = f"{java_opts} -cp {bm[prog]} {prog}"
            if arg_val:
                args += f" {arg_val}"
            return exe, args
        do_bench("java", java_bin, java_builder)

    # --- Write CSV ---
    if results:
        # 1. Summary CSV (avg + peak per metric, Excel-friendly)
        def list_avg(lst):
            return round(sum(lst) / len(lst), 2) if lst else 0
        def list_peak(lst):
            return round(max(lst), 2) if lst else 0

        summary_rows = []
        for r in results:
            cpu_list = [float(x) for x in r["cpu(%)"].split(";") if x] if r["cpu(%)"] else []
            sr = {
                "case_name": r["case_name"],
                "language":  r["language"],
                "cpu_avg(%)":  list_avg(cpu_list),
                "cpu_peak(%)": list_peak(cpu_list),
            }
            for f in MEM_FIELDS:
                key = f"{f}(byte)"
                vals = [float(x) for x in r[key].split(";") if x] if r[key] else []
                sr[f"{f}_avg(byte)"]  = list_avg(vals)
                sr[f"{f}_peak(byte)"] = list_peak(vals)
            sr["cost_time(s)"]        = r["cost_time(s)"]
            sr["cpu_load(%)"]         = r["cpu_load(%)"]
            sr["rss_max(byte)"]       = r["rss_max(byte)"]
            sr["rss_integral(byte)"] = r["rss_integral(byte)"]
            summary_rows.append(sr)

        with open(SUMMARY_PATH, "w", newline="", encoding="utf-8") as fh:
            w = csv.DictWriter(fh, fieldnames=SUMMARY_COLUMNS)
            w.writeheader()
            for sr in summary_rows:
                w.writerow(sr)
        log(f"Summary CSV saved: {SUMMARY_PATH} ({len(summary_rows)} rows)")

        # 2. Detail CSV (full sample lists, semicolon-separated)
        with open(DETAIL_PATH, "w", newline="", encoding="utf-8") as fh:
            w = csv.DictWriter(fh, fieldnames=CSV_COLUMNS)
            w.writeheader()
            for row in results:
                w.writerow(row)
        log(f"Detail CSV saved: {DETAIL_PATH} ({len(results)} rows)")

        log("Summary (avg cost_time by program+lang):")
        groups = defaultdict(list)
        for r in results:
            groups[(r["case_name"], r["language"])].append(r["cost_time(s)"])
        for (prog, lang), times in sorted(groups.items()):
            avg = sum(times) / len(times)
            print(f"  {prog:<15} {lang:<5} avg={avg:>8.3f}s  (n={len(times)})", flush=True)
    else:
        log("No results to write.")

    log("Done.")


if __name__ == "__main__":
    main()
