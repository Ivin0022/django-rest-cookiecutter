#!/bin/bash

cd example/
rm -rf ./*
cookiecutter $(pwd)/../
# cookiecutter gh:Ivin0022/django-rest-cookiecutter
