# Run
## Description

This folder includes the "run.sh" to run all the benchmark and store the result. However, this shell script couldn't run simply by calling "./run.sh". You may need to modify the distributed command, which includes the hostname needed to be modified. This script reuses the spack software to load the software installed previously.

## environment valuables needed

```bash
source ../../compile/spack-0.18.1/share/spack/setup-env.sh
```

To run the command above will help to get the spack environment.
