CircularProgress
================

In writing an app with a circular progress bar, I originally had a subclass of UIView which created new UIBeizerPaths in the drawRect of a UIView to show the progression (in this case of a track playing):



I recently changed it to be drawn with a couple of CAShapeLayers (one for the white background, one for the purple progress) so that it's easy to animate the purple progress line:



Having made this change, I've had some issues with how it looks now. The white is showing through behind the purple, and generally does not look as sharp.

Below is a screenshot of each way, and a diff (using ImageMagick, see http://stackoverflow.com/questions/5132749/imagemagick-diff-an-image)



This project is a sample app with an example of both ways, in an attempt to try and work out what the issue is.
