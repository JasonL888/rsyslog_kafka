#!/bin/bash
echo_and_run() {
    echo -e "\nExecuting >>> $@";
    "$@";
    echo -e "Executing <<<\n";
}
