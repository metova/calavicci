# Calavicci

Wrapper to execute a drawable converter to convert high resolution Android resources to lower resolution resources.

## Prerequisites

Must have [ImageMagick](http://www.imagemagick.org/script/index.php) installed on the machine on which you wish to use this gem. If you're on a Mac, make it easy on yourself and install it via [Homebrew](http://brew.sh):

    brew install imagemagick

## Installation

    gem install calavicci

## Usage

Give calavicci the largest resolution resources you have. If you do not specify any output directories (`-d` flags), then it will automatically scale to mdpi and hdpi, based on the input directory you give it.

    calavicci ~/workspace/hello-world-android/res/drawable-xhdpi
    
Or, specify the output directories:

    calavicci -d ~/workspace/hello-world-android/res/drawable-mhdpi -d ~/workspace/hello-world-android/res/drawable-hhdpi ~/workspace/hello-world-android/res/drawable-xhdpi

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Acknowledgement

The `drawable_convert.py` script has been adapted from the original script found at this GitHub Gist: https://gist.github.com/kmansoft/2771791