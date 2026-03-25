
function StopPath() {
    if (pathActive) {
        path_end();
        path_delete(path);
        pathActive = false;
    }
}