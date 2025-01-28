#!/bin/bash

# Function to start the server
start_server() {
    sphinx-build -b html /workspaces/sphinx-devcontainer/source /workspaces/sphinx-devcontainer/docs
    python -m http.server 8000 --directory /workspaces/sphinx-devcontainer/docs &
    echo $! > /workspaces/sphinx-devcontainer/server.pid
    echo "Server started with PID $(cat /workspaces/sphinx-devcontainer/server.pid)"
}

# Function to stop the server
stop_server() {
    if [ -f /workspaces/sphinx-devcontainer/server.pid ]; then
        kill $(cat /workspaces/sphinx-devcontainer/server.pid)
        rm /workspaces/sphinx-devcontainer/server.pid
        echo "Server stopped"
    else
        echo "Server is not running"
    fi
}

# Check command line arguments
case "$1" in
    start)
        start_server
        ;;
    stop)
        stop_server
        ;;
    restart)
        stop_server
        start_server
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac