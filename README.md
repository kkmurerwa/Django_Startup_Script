# Django Startup Script for Windows
This repo contains a batch file that automates the creation of new Django projects on Windows.

## What it does
1. Creates a folder for a new project and opens it.
2. Creates a virtual environment for you with the latest Django version.
3. Runs startproject config. This creates the folder that houses all major python files for a Django project such as *settings.py* and *urls.py*
4. Performs migration to eliminate any migration warnings.
5. (Optional) Creates any number of apps you want to create.
6. (Optional) Adds an app-level urls.py files to each app created.
7. Creates a project-level *templates* folder and initializes it with a *base.html* file. You will still have to add routes manually to *settings.py* and app-level *views.py* and *urls.py*.
8. Creates a base.html file in templates for the base html code.
9. Creates a project-level *static* folder and creates *css*, *js* and *img* subfolders.


## Prerequisites
In order to utilize this script, you should have;
1. Python 3.* installed. Check out the latest version of python on the [official website](https://www.python.org/downloads/).
2. Pipenv installed on your Windows computer. If you don't have pipenv installed on your computer, you can install it using pip, which comes bundled with Python releases. Type the following commands.

    ```python
    #Upgrade pip to ensure you have the latest version
    python -m pip install --upgrade pip
      
    #Install pipenv using pip
    pip install pipenv


## Instructions for use
I highly doubt you will need instructions for this script. It involves a lot of prompts and provides output for every step it takes in the process. **However**, make sure you are in the directory you want to create the new project in. Copy the batch script into the folder and just run it from there since it creates the new project in the current directory.


## Disclaimer
As usual, there is usually a different structure that every developer uses. That is also the case with this batch script. It is made to suit the structure I have adopted for Django Projects. Feel free to modify the file in accordance with the license below.
      
      
## Licenses and et cetera
This script is published under the [MIT License](https://github.com/angular/angular.js/blob/master/LICENSE). This grants any willing party permission to use and manipulate the file as they see fit, without any restriction. As such, this project is available for use by any willing contribitor or developer as stipulated by the terms of the License. Contributions are very welcome.
