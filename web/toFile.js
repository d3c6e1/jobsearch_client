function ToFile(arg) {
    let blob = new Blob([arg], {type: "application/pdf"});
    let objectUrl = URL.createObjectURL(blob);
    window.open(objectUrl)
}