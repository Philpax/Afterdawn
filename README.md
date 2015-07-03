# Afterdawn
Extremely high-speed racer, inspired by [Ballistics](https://www.youtube.com/watch?v=BXj5tuAtfGs) but with increased freedom in terms of navigation and track design, as well as modern ideas in game design. Currently, it serves as a testbed for Vespertine; there is no actual game as of present.

## Building
The build system is Premake5. Afterdawn currently only builds on Windows (due to an indirect dependency on D3D11). This may be fixed in future.

1. Clone this repository to a directory of your choice.
2. Run `git submodule init` and `git submodule update` to pull down Vespertine.
3. Create a VS2013 solution using `premake5 vs2013`.
4. Build the solution.