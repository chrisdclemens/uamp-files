# Ubuntu Apache MySQL Setup Files

## Description</h2>

UAMP-files is a project that consists of a bunch of configuration files that allows quick setup of Ubuntu and Apache / MySQL / PHP.

## Production Ready 

Nope. Not at all. This is written for development people. These settings and setup is ideal for development. It's not recommended for production because it'll open up attack vectors.

## Features

* Setup Oh My Zsh quickly or just use bash if you're not ready yet
* Setting up your development box and starting Apache
* Or if you don't like apache. Feel free to run the nginx setup

## I'm convinced. Let's get started

So each folder has it's on setup script. Open to that folder and then run the setup

    ## For example let's go here and setup drupal
    cd drupal/ && ./setup.sh
    
    ## Or php
    cd php && ./setup.sh
    
    ## Or let's setup nginx
    cd nginx && ./setup.sh
    

## Pull Requests

The commands are commands i've found around stackoverflow and many blogging resources that i've run once. If you'd like improve them!
