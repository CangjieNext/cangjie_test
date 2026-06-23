# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

"""CJProf dominance tree test script.

Usage: python3 dominance_test.py <info_file>

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


def find_free_port(start=19000, stop=19999):
    """Find a free TCP port in the given range."""
    for port in range(start, stop):
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        try:
            sock.bind(('127.0.0.1', port))
            sock.close()
            return port
        except OSError:
            continue
    raise RuntimeError(f"No free port found in range {start}-{stop}")


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
    """Parse a test line: test_name,api_endpoint,grep_pattern,assert_type,assert_value"""
    parts = line.split(',')
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
    """Start cjprof HTTP server on given port with given data file.
    cjprof must be in PATH (cjprof.exe on Windows, cjprof on Linux/Mac)."""
    cjprof = 'cjprof.exe' if sys.platform == 'win32' else 'cjprof'
    cmd = [cjprof, 'heap', '-i', data_file, '--dump-report=' + str(port)]
    # start_new_session=True puts cjprof in its own process group so kill_server's
    # os.killpg only kills cjprof, not this test script. Harmless on Windows
    # (no process-group concept there; kill_server uses taskkill /PID instead).
    proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                            start_new_session=True)
    return proc


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
    """Fetch JSON from HTTP API endpoint."""
    import urllib.request
    url = f'http://127.0.0.1:{port}{endpoint}'
    try:
        raw = urllib.request.urlopen(url, timeout=10).read()
        return raw.decode('utf-8')
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
    """Check assertion on grep results."""
    import re
    for match in match_results:
        if assert_type == 'scan':
            if assert_value in match:
                return True
        elif assert_type == 'regex':
            if re.search(assert_value, match):
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

        # Find free port
        port = find_free_port()

        # Clean any stale cache
        cache_file = data_path + '.cjprof.db'
        if os.path.isfile(cache_file):
            os.remove(cache_file)

        # Copy data file to working directory
        work_data = os.path.basename(data_file)
        if data_path != work_data and os.path.abspath(data_path) != os.path.abspath(work_data):
            import shutil
            shutil.copy2(data_path, work_data)
        else:
            work_data = data_path

        # Start server
        print(f"Starting cjprof with {work_data} on port {port}")
        proc = start_server(work_data, port)

        # Wait for server to be ready
        alive, stderr = check_server_alive(proc)
        if not alive:
            print(f"FAIL: cjprof process exited unexpectedly:\n{stderr}")
            all_pass = False
            continue

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
        print("Usage: python3 dominance_test.py <info_file>")
        os._exit(1)
    run_tests(sys.argv[1])
