#!/usr/bin/env python3

import sys
import xml.etree.ElementTree as ET

def parse_xml_file(filename):
    try:
        tree = ET.parse(filename)
        return tree.getroot()
    except ET.ParseError as e:
        print(f"Error: Failed to parse XML file - {e}", file=sys.stderr)
        sys.exit(1)
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)

def main():
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <xml_file>", file=sys.stderr)
        sys.exit(1)
    
    filename = sys.argv[1]
    
    root = parse_xml_file(filename)

if __name__ == "__main__":
    main()