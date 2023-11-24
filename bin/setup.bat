@echo off

echo ****************************************
echo  Setting up Capstone Environment
echo ****************************************

echo Installing Python 3.8...
powershell -Command "Start-Process msiexec.exe -ArgumentList '/i https://www.python.org/ftp/python/3.8.0/python-3.8.0-amd64.exe /quiet InstallAllUsers=1 PrependPath=1' -Wait"

echo Making Python 3.8 the default...
setx path "%path%;C:\Python38\Scripts;C:\Python38"

echo Checking the Python version...
python --version

echo Creating a Python virtual environment...
python -m venv %UserProfile%\.virtualenvs\backend-django-venv

echo Configuring the developer environment...
setx GITHUB_ACCOUNT "%GITHUB_ACCOUNT%"
rem Add any additional environment variable configurations here

echo Installing Python dependencies...
call %UserProfile%\.virtualenvs\backend-django-venv\Scripts\activate.bat
python -m pip install --upgrade pip wheel
pip install -r requirements.txt
echo @call "%UserProfile%\.virtualenvs\backend-django-venv\Scripts\activate.bat" >> %UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\activate_venv.bat

echo ****************************************
echo  Capstone Environment Setup Complete
echo ****************************************
echo.
echo Please restart your computer to initialize the environment
echo.
