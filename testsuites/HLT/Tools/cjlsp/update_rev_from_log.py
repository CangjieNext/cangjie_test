import os
import re

def parse_log(log_path):
    mapping = {}
    with open(log_path, 'r', encoding='utf-8', errors='ignore') as f:
        lines = f.readlines()
    n = len(lines)
    for i in range(n):
        line = lines[i].rstrip('\r\n')
        if 'receive message:' in line:
            j = i + 1
            while j < n and lines[j].strip() == '':
                j += 1
            if j >= n:
                continue
            json_line = lines[j].rstrip('\r\n')
            k = i
            rel_path = None
            back_limit = 300
            while k >= 0 and i - k <= back_limit:
                prev = lines[k].rstrip('\r\n')
                if 'Name' in prev and 'autotestcase' in prev:
                    pos = prev.find(':')
                    if pos != -1:
                        candidate = prev[pos+1:].strip()
                        if candidate.endswith('.info') and candidate.startswith('HLT/Tools/cjlsp/testcases/autotestcase/'):
                            rel_path = candidate
                            break
                k -= 1
            if rel_path:
                mapping[rel_path] = json_line
    return mapping

def update_info_files(base_root, mapping):
    updated = []
    for rel_path, json_line in mapping.items():
        abs_path = os.path.join(base_root, rel_path.replace('/', os.sep))
        if not os.path.isfile(abs_path):
            continue
        with open(abs_path, 'r', encoding='utf-8', errors='ignore') as f:
            lines = f.readlines()
        idx = None
        for k, l in enumerate(lines):
            if l.strip() == 'Rev#':
                idx = k
                break
        if idx is None:
            continue
        if idx + 1 < len(lines):
            lines[idx + 1] = json_line + '\n'
        else:
            lines.append(json_line + '\n')
        with open(abs_path, 'w', encoding='utf-8', errors='ignore', newline='\n') as f:
            f.writelines(lines)
        updated.append(abs_path)
    return updated

def main():
    log_path = os.environ.get('CJ_LOG_PATH', r'd:\cangjie_test\testsuites\HLT\log\j_Nuj7cg5n.log')
    base_root = os.environ.get('CJ_BASE_ROOT', r'd:\cangjie_test\testsuites')
    mapping = parse_log(log_path)
    print('mapping', len(mapping))
    updated = update_info_files(base_root, mapping)
    print('updated', len(updated))
    for p in updated[:50]:
        print(p)

if __name__ == '__main__':
    main()
