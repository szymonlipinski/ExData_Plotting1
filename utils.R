# Common utility functions.
#
# author: Szymon Lipiński
#

# Installs the package if is not installed.
install_package <- function(package) {
    if(!(package %in% rownames(installed.packages()))) {
        install.packages(package)
    }
}

# Clears the console.
clear <- function() cat("\014")


# Prints green in console
cat_red   <- function(text) cat(red(paste(text, "\n")))
cat_green <- function(text) cat(green(paste(text, "\n")))
cat_blue  <- function(text) cat(blue(paste(text, "\n")))

# Downloads given file if the output file doesn't exist.
download_file <- function(
    url,
    destfile,
    use_force=FALSE,
    unzip=FALSE,
    remove_source=FALSE
    ) {

    if ( file.exists(destfile) && !use_force) {
        clear()
        cat_red("File already exists, doing nothing")
        return()
    }
    download.file(url, destfile)

    if (unzip) unzip(destfile)
    if (remove_source) file.remove(destfile)

    clear()
    cat_green("Downloaded file")
}