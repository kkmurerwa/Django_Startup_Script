@echo off

::This Batch script helps shorten the time needed to create every other Django project and project folder. 

echo Make sure no other shell is running in the background before you continue

pause

echo.
echo.

set /A counter=0
set /A counter2=0
set /A counter3=0

:entername
    echo Enter the name of the project folder you want to create

    set /P foldername=

    echo.
    echo.

    :: Create folder if input is not empty
    if not "%foldername%" equ "" ( echo Creating folder...
        mkdir %foldername%
        cd %foldername%

        ::Go to next function
        goto :create-basic-folders-and-files
        exit /B 0
    )

    :: Request for input again if input is empty
    if "%foldername%" equ "" (
        if not %counter% geq 2 (
            echo No value detected. Please try again...
            set /A counter+=1
            goto :entername
        )
        if %counter% geq 2 (
            echo You are beyond help kind sir/madam. System will now exit...
            exit /B 0
        )
    )

:create-basic-folders-and-files
    echo.
    echo Creating additional folders...
    mkdir templates
    echo Created /templates
    ::Create base.html on the templates page
    echo. >templates/base.html
    echo Created /templates/base.html

    ::Create static page for resources
    mkdir static
    echo Created /static
    cd static

    ::Create folders for basic resources such as css/js/images
    mkdir css
    echo Created /static/css
    mkdir js
    echo Created /static/js 

   
    mkdir img
    echo Created /static/img

    cd..

    goto :pipenv-commands
    exit /B 0


:pipenv-commands
    echo.

    :: Create a Virtual environment
    pipenv install django~=3.0.0


    :: Activate Virtual Environment and run startup config
    pipenv run django-admin startproject config .

    :: Perform initial migration to avoid warnings
    pipenv run python manage.py migrate

    goto :create-app-query
    exit /B 0

:create-app-query
    echo.

    echo Congrats. Setup is complete. Would you like to create the first app? Reply with Y or N.

    set /P decision=

    if not "%decision%" equ "" (
        if "%decision%" equ "Y" goto :create-app
        if "%decision%" equ "y" goto :create-app
        if "%decision%" equ "N" goto :start-server
        if "%decision%" equ "n" goto :start-server

        echo.
        echo Invalid input. Try again
        goto :create-app-query

        exit /B 0
    )

    if "%decision%" equ "" (
        if not %counter2% geq 2 (
            echo No input detected. Please try again...
            set /A counter2+=1
            goto :create-app-query
        )
        if %counter2% geq 2 (
            echo How did you even manage the first section? System will now exit...
            timeout 3
            exit /B 0
        )
    )

:create-another-app-query
    echo.
    echo We have created that app for you. Would you like to create another app? Reply with Y or N.

    set /P decision=

    if not "%decision%" equ "" (
        if "%decision%" equ "Y" goto :create-app
        if "%decision%" equ "y" goto :create-app

        if "%decision%" equ "N" goto :start-server
        if "%decision%" equ "n" goto :start-server
        

        echo.
        pause

        exit /B 0
    )

    if "%decision%" equ "" (
        if not %counter3% geq 2 (
            echo No input detected. Please try again...
            set /A counter3+=1
            goto :create-app-query
        )
        if %counter3% geq 2 (
            echo I'm surprised you managed to reach here. Better luck next time...
            timeout 3
            exit /B 0
        )
    )

:create-app
    echo.
    echo Enter the app name

    set /P appname=

    :: pipenv run exit
    pipenv run python manage.py startapp %appname%

    cd %appname%

    echo.
    echo Creating %appname%/urls.py file...
    echo.
    :: Create app/urls.py file
    echo. >urls.py

    cd..


    goto :create-another-app-query

:start-server


pause