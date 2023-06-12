#!/bin/bash

: '
    This Bash script will effortlessly orchestrate the creation of your React project using Vite, 
    seamlessly weave in the magic of Tailwind CSS, and gracefully update the index.css file, 
    all with just a few strokes of your keyboard. 
    Say goodbye to manual setup and hello to an automated journey towards an optimized development environment. 
    Let the script be your guide as it artfully assembles the building blocks, 
    leaving you with a canvas primed for creativity. 
    Get ready to dive into your project with a wave of excitement as the script unfurls its wizardry, 
    culminating in a delightful blend of React, Vite, and Tailwind CSS
'


if [-z "$1"]; then
    echo "Project Name Not Provided"
    zenity --warning --text="No Project Name Provided"
else 
    # @dev $1 is project name
    npm create vite $1 -- --template react
    # open folded and npm install
    cd $1
    npm install
    # tailwind config
    npm install -D tailwindcss postcss autoprefixer
    npx tailwindcss init -p
    echo "/** @type {import('tailwindcss').Config} */
    export default {
    content: [
        \"./index.html\",
        \"./src/**/*.{js,ts,jsx,tsx}\",
    ],
    theme: {
        extend: {},
    },
    plugins: [],
    }" > tailwind.config.js

    # @dev updating index.css
    pwd
    echo "@tailwind base;
    @tailwind components;
    @tailwind utilities;
    " > ./src/index.css
    cat ./src/index.css
    # last
    # Display a GUI alert
    zenity --info --text="Hello, Created react Project and Tailwindcss added"
    code .
    ls
fi