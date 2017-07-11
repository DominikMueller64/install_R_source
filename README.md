# Install different R versions from source

A simple shell script to install different versions of R (3.X.X) directly from source.
Tested on Ubuntu 14.04.

## Usage

Clone this repository or copy the shell script. Make it executable with `chmod +x install_R_source`.

The script accepts a single command line argument, which is the version of R that should be installed in the format d.d.d, *e.g.*, 3.4.1.
Make sure the requested version is available from <https://cran.r-project.org/src/base/R-3/>.

Example:
`./install_R_source 3.4.1`
