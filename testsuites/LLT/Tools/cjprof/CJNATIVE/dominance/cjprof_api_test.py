# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

"""CJProf HTTP API test script.

Generic runner: starts a cjprof heap server, fetches the API endpoints listed
in an info file, and asserts grep patterns against the JSON responses. The
info file is data-driven — no cjprof/dominance/sunburst knowledge is hardcoded
here, so the same script tests any cjprof HTTP API (dominance tree, top10,
sunburst data sources, etc.).

Usage: python3 cjprof_api_test.py <info_file>

The info file contains test directives after a 'test#' marker.
Each line format: test_name,api_endpoint,grep_pattern,assert_type,assert_value

test_name:   identifies the data file (e.g. dom_cyclic → dom_cyclic.data)
api_endpoint: /api/dominance/tree, /api/dominance/top10, /api/dominance/tree-by-type
grep_pattern: regex or literal string to search in the JSON response
assert_type:  'regex' or 'scan'
assert_value: the expected match string

Example info file content after test#:
  dom_cyclic,/api/dominance/tree,class_name:default::Node,regex,retained_size":32
  dom_chain,/api/dominance/tree,class_name:default::Node,regex,retained_size":64
"""

import sys
import os
import subprocess
import time
import json
import signal
import socket
import random
import re
import threading


def find_free_port(start=19000, stop=19999):
    """Find a free TCP port in the given range.

    NOTE: This only *suggests* a port — it does not reserve it. The previous
    implementation (bind then close then return) had a TOCTOU race under
    parallel execution (-jN): between the close() and cjprof's own bind() another
    concurrent case could grab the same port, sending requests to the wrong server
    and producing spurious FAILs. We now hand the suggested port to cjprof, which
    resolves the actual free port itself (see HeapAnalyzer::StartReportServer:
    it walks actualPort++ while isPortInUse) and reports it via stdout, then read
    the real port back from cjprof's "Access URL" log line. bind+listen happen
    inside cjprof, eliminating the cross-process window."""
    rng = random.Random(os.getpid() ^ int(time.time() * 1000) & 0xffffffff)
    # Spread concurrent cases across the range so they don't all start scanning
    # from the same base and collide on the first free slot.
    span = stop - start
    offset = rng.randrange(span)
    return start + offset



def read_test_lines(info_file):
    """Read test directives from info file after 'test#' marker."""
    with open(info_file, encoding='UTF-8') as f:
        lines = f.readlines()

    # Find 'test#' marker
    test_index = None
    for i, line in enumerate(lines):
        if line.strip() == 'test#':
            test_index = i
            break

    if test_index is None:
        print("FAIL: no 'test#' marker found in info file")
        os._exit(1)

    return [line.strip() for line in lines[test_index + 1:] if line.strip() and not line.startswith('#')]


def parse_test_line(line):
    """Parse a test line: test_name,api_endpoint,grep_pattern,assert_type,assert_value

    assert_value may itself contain commas (several expected substrings), so
    split at most 4 times — the 5th field keeps everything after the 4th comma,
    including any commas inside it."""
    parts = line.split(',', 4)
    if len(parts) < 5:
        print(f"FAIL: invalid test line format: {line}")
        os._exit(1)
    return {
        'test_name': parts[0],
        'api_endpoint': parts[1],
        'grep_pattern': parts[2],
        'assert_type': parts[3],
        'assert_value': parts[4],
    }


def start_server(data_file, port):
    """Start cjprof HTTP server with the given *suggested* port and data file.

    cjprof does NOT guarantee to listen on `port`: if it is already in use,
    HeapAnalyzer::StartReportServer walks actualPort++ while isPortInUse and
    binds the first free one it finds, then logs "Access URL: http://localhost:PORT".
    We read that line back from stdout to learn the *actual* port, so requests
    always hit the right server even when several cases run concurrently.
    cjprof must be in PATH (cjprof.exe on Windows, cjprof on Linux/Mac)."""
    cjprof = 'cjprof.exe' if sys.platform == 'win32' else 'cjprof'
    cmd = [cjprof, 'heap', '-i', data_file, '--dump-report=' + str(port)]
    # start_new_session=True puts cjprof in its own process group so kill_server's
    # os.killpg only kills cjprof, not this test script. Harmless on Windows
    # (no process-group concept there; kill_server uses taskkill /PID instead).
    proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                            start_new_session=True, text=True, bufsize=1)
    return proc


def read_actual_port(proc, timeout=15):
    """Read cjprof stdout until it logs the port it actually bound.

    Returns the real port number, or None if the process exited or no line
    appeared within timeout. Done in a reader thread so we can stream stdout
    line-by-line instead of blocking until EOF (the server never exits)."""
    actual = {'port': None, 'stderr_tail': []}

    def reader():
        # stdout lines arrive as the server boots; we scan for the Access URL.
        if proc.stdout is None:
            return
        deadline = time.time() + timeout
        for line in proc.stdout:
            m = re.search(r'localhost:(\d+)', line)
            if m and actual['port'] is None:
                actual['port'] = int(m.group(1))
                return
            if time.time() > deadline:
                return

    t = threading.Thread(target=reader, daemon=True)
    t.start()
    t.join(timeout)
    return actual['port']


def check_server_alive(proc):
    """Check if cjprof server process is still running."""
    if proc.poll() is not None:
        # Process has exited — read stderr for crash info
        stderr = proc.stderr.read().decode('utf-8', errors='replace')
        return False, stderr
    return True, ""


def wait_for_server(port, timeout=15):
    """Wait for HTTP server to become ready by sending an actual HTTP request."""
    import urllib.request, urllib.error
    url = f'http://127.0.0.1:{port}/api/snapshot'
    for i in range(timeout):
        try:
            urllib.request.urlopen(url, timeout=2)
            return True
        except urllib.error.HTTPError:
            # Server responded (even with error code) — it's alive
            return True
        except (urllib.error.URLError, socket.timeout, ConnectionRefusedError, OSError):
            time.sleep(1)
    return False


def kill_server(proc):
    """Kill the cjprof server process."""
    try:
        if sys.platform == 'win32':
            subprocess.call(['taskkill', '/F', '/PID', str(proc.pid)],
                           stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        else:
            os.killpg(os.getpgid(proc.pid), signal.SIGTERM)
    except (ProcessLookupError, OSError):
        pass


def fetch_api(port, endpoint):
    """Fetch body from HTTP API endpoint.

    Returns the response body even for 4xx/5xx (so error-response branches like
    'Invalid parent_id' / 'Bad Request' / 'Not Found' can be asserted on);
    only real transport failures (connection refused, timeout) return None."""
    import urllib.request, urllib.error
    url = f'http://127.0.0.1:{port}{endpoint}'
    try:
        raw = urllib.request.urlopen(url, timeout=10).read()
        return raw.decode('utf-8', errors='replace')
    except urllib.error.HTTPError as e:
        # 4xx/5xx: the server responded — read the error body so the caller can
        # grep it. Coverage-wise this still exercised cjprof's handler code.
        try:
            body = e.read().decode('utf-8', errors='replace')
            return body
        except Exception:
            print(f"FAIL: fetch {url} HTTP {e.code} but body unreadable: {e}")
            return None
    except Exception as e:
        print(f"FAIL: fetch {url} failed: {e}")
        return None


def grep_json(json_text, pattern):
    """Search for pattern in JSON text, similar to grep."""
    import re
    if pattern.startswith('class_name:'):
        # Special pattern: extract object entries by class_name
        # e.g. 'class_name:default::Node' → grep -o '"class_name":"default::Node"[^}]*}'
        class_name = pattern[len('class_name:'):]
        regex = '"class_name":"' + re.escape(class_name) + '"[^}]*}'
        matches = re.findall(regex, json_text)
        return matches

    # Standard regex search — return the full JSON text as context
    # so that assert_value can be checked within the same response
    if re.search(pattern, json_text):
        return [json_text]

    return []


def run_assert(match_results, assert_type, assert_value):
    """Check assertion on grep results.

    assert_value may list several comma-separated expected substrings; ALL of
    them must match the SAME match (AND within a single match) for the assertion
    to pass. Returns True if any one match satisfies every expected substring."""
    import re
    expected = assert_value.split(',')
    for match in match_results:
        all_hit = True
        for exp in expected:
            if assert_type == 'scan':
                hit = exp in match
            elif assert_type == 'regex':
                hit = re.search(exp, match) is not None
            else:
                hit = False
            if not hit:
                all_hit = False
                break
        if all_hit:
            return True
    return False


def run_tests(info_file):
    """Main test runner."""
    test_lines = read_test_lines(info_file)
    tests = [parse_test_line(line) for line in test_lines]

    if not tests:
        print("FAIL: no test lines found")
        os._exit(1)

    # Group tests by data file — each data file needs its own server
    data_groups = {}
    for test in tests:
        data_file = test['test_name'] + '.data'
        if data_file not in data_groups:
            data_groups[data_file] = []
        data_groups[data_file].append(test)

    all_pass = True

    for data_file, group_tests in data_groups.items():
        # Check if data file exists — search in multiple locations
        info_dir = os.path.dirname(os.path.abspath(info_file))
        search_paths = [
            data_file,                          # current working directory
            os.path.join(info_dir, data_file),  # same dir as info file
            os.path.join(info_dir, '..', 'sample', data_file),  # sibling sample directory
            os.path.join(info_dir, 'sample', data_file),  # sample subdirectory
        ]
        data_path = None
        for p in search_paths:
            if os.path.isfile(p):
                data_path = p
                break
        if data_path is None:
            print(f"FAIL: data file not found: {data_file} (searched: {search_paths})")
            all_pass = False
            continue

        # Suggest a port; cjprof resolves the actual free port itself (see
        # find_free_port/start_server) and reports it via stdout.
        port = find_free_port()

        # Copy data file to working directory. A committed .cjprof.db may be
        # declared in DEPENDENCE alongside the data file; the framework copies
        # both into a fresh temp dir, so we must NOT delete the cache here —
        # doing so would make cjprof re-parse instead of hitting the load path.
        # NOTE: do NOT auto-copy *.cjprof.db here unconditionally — the framework
        # already copies files declared in DEPENDENCE. Auto-copying the db for a
        # case that did NOT declare it (e.g. all_tags_01, which shares
        # all_tags.data with cache_load_01) forces an unintended cache-hit:
        # the saved SnapshotEntry has no address_range fields, so fragment/overview
        # drops address_range_start and fragment/distribution returns empty, and
        # the case FAILs. Only cache_load_01 declares the db, so only it gets one.
        work_data = os.path.basename(data_file)
        if data_path != work_data and os.path.abspath(data_path) != os.path.abspath(work_data):
            import shutil
            shutil.copy2(data_path, work_data)
        else:
            work_data = data_path

        # Start server
        print(f"Starting cjprof with {work_data} (suggested port {port})")
        proc = start_server(work_data, port)

        # Wait for server to be ready
        alive, stderr = check_server_alive(proc)
        if not alive:
            print(f"FAIL: cjprof process exited unexpectedly:\n{stderr}")
            all_pass = False
            continue

        # Read the actual port cjprof bound (it may differ from the suggestion
        # under -jN parallelism, since cjprof walks to the next free port).
        actual_port = read_actual_port(proc)
        if actual_port is not None:
            port = actual_port

        if not wait_for_server(port):
            alive, stderr = check_server_alive(proc)
            if not alive:
                print(f"FAIL: cjprof process crashed during startup:\n{stderr}")
            else:
                print(f"FAIL: cjprof server did not start on port {port}")
            kill_server(proc)
            all_pass = False
            continue

        # Run each test against this server
        for test in group_tests:
            alive, stderr = check_server_alive(proc)
            if not alive:
                print(f"FAIL: cjprof process crashed before {test['api_endpoint']}:\n{stderr}")
                all_pass = False
                break

            json_text = fetch_api(port, test['api_endpoint'])
            if json_text is None:
                alive, stderr = check_server_alive(proc)
                if not alive:
                    print(f"FAIL: cjprof process crashed during {test['api_endpoint']}:\n{stderr}")
                else:
                    print(f"FAIL: {test['test_name']} {test['api_endpoint']} — no response")
                all_pass = False
                continue

            match_results = grep_json(json_text, test['grep_pattern'])
            passed = run_assert(match_results, test['assert_type'], test['assert_value'])

            status = "PASS" if passed else "FAIL"
            print(f"{status}: {test['test_name']} {test['api_endpoint']} "
                  f"grep={test['grep_pattern']} assert={test['assert_type']}:{test['assert_value']}")
            if not passed:
                # Print actual values for debugging
                if match_results:
                    print(f"  actual matches: {match_results}")
                else:
                    print(f"  no matches found for grep pattern '{test['grep_pattern']}'")
                print(f"  full response: {json_text[:500]}")
                all_pass = False

        # Kill server
        kill_server(proc)

        # Wait for process to fully terminate
        try:
            proc.wait(timeout=5)
        except subprocess.TimeoutExpired:
            proc.kill()

        # Clean up cache
        cache_file = work_data + '.cjprof.db'
        if os.path.isfile(cache_file):
            os.remove(cache_file)

    if all_pass:
        print("ALL PASS")
        os._exit(0)
    else:
        print("SOME FAIL")
        os._exit(1)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 cjprof_api_test.py <info_file>")
        os._exit(1)
    run_tests(sys.argv[1])
