#! /bin/bash
find . -type f -name *.rb -o -name *.ru > src-files
ctags -L src-files
