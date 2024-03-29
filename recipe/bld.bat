:: Setup directory structure
mkdir build
if errorlevel 1 exit 1

:: Configure 
cmake -G "Ninja" -B "build" -S . ^
         -DBUILD_SHARED_LIBS=ON ^
         -DCMAKE_BUILD_TYPE=Release ^
         -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
         -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
         -DCMAKE_VERBOSE_MAKEFILE=ON
if errorlevel 1 exit 1

:: Build and install
cd build
if errorlevel 1 exit 1
ninja
if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1
