# Requirement

All tools require `p4c` to be installed. The fuzz tester and P4-to-Z3 converter are also p4c extensions which need to be copied or symlinked into the `extensions` folder of the compiler. The `do_install.sh` contains detailed command instructions. Most dependencies can be installed by running `./do_install.sh` in the source folder (**Careful**, the installation assumes root privileges and installs several large packages).



# Usage

`python test.py`


# Bug Finding
`https://github.com/p4lang/p4c/issues/4548`
`https://github.com/p4lang/p4c/issues/4596`
`https://github.com/p4lang/p4c/issues/4579`
