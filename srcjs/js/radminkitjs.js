// preloader
document.addEventListener("DOMContentLoaded", () => {
    setTimeout(function () {
        document.querySelector(".loader-bg").style.opacity = '0';
        document.querySelector(".loader-bg").remove();
    }, 400);
});