Sample-Theme
============

A theme using tools and practices for CSS pre and post processing

Frameworks/Tools
- SASS
- LESS

Methodologies/Practices
- OOCSS
- BEM
- SMACSS

Conventions related to colors

This theme uses a 5 layer color variable abstraction (Yes that number is correct, and no this is not overcomplicated once you look at the structure)

- Color book (from color catalogue)

- Color palette
Taking advantage of the new mapping feature in SASS 3.3, this project contains a color palette with an 3D array of color names.

The structure is CVS which stands for Color, Variation, and Shade

These color names are colors in their simplest written form (e.g red, green, blue) but uses the values of fancy colour name values taken from color books (see the colorly project for more info).

Simple example:
$orange = obi('mandarine-1');

Combine this with a syntax for dictating tones randing from dark to light using you guessed it.
- darkest
- darker
- dark
- base
- light
- lighter
- lightest

The fact that a few color books have 14 different shades of each color means you can abstract to this scheme using two versions of a color name, bright and dim

- Color scheme
Abstracting from the color palette to use variable names representing hierachy rather than straight up color names, your themes become a lot more versatile and easily modifyable/extendable should you wish to change colors, without been tied to changing multiple instances of your previous color choice

So changing from $blue to $primary-color.

- Color hierachy

- (Optional) Color hierachy overrides