#!/bin/bash
ps aux | awk -v user="$1" '$1 == user && $6 > 0 && $7 > 0'
