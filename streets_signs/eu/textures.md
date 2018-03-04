# Streets Mod: EU Signs Texture Guide

## Image Size
For normal signs, the image size is 128x128px.

For big signs, the image size is 384x384px.

Big signs fill the space of 3x3 nodes.

If those dimensions are too big, leave a transparent padding.
Normally, the signs should be centered. There are a few exception:

### Complementary Plates
For complementary plates that don't consume the whole available space,
leave 8px top padding. This avoids ugly gaps on sign posts.

### Direction Arrows
It looks better when direction arrows are not centered horizontally,
but when the padding is computed as follows:

You need the following information:

* Length of the arrow tip
* Length of the arrow body

On the side of the arrow tip, the padding should be smaller than on the arrow's body side.

The larger padding is computed according to the following formula:

```
                  384 - ( Arrow's body length + 1/3 * Arrow's tip length )
Padding (large) = ––––––––––––––––––––––––––––––––––––––––––––––––––––––––
                                             2
```

The smaller padding is computed as follows:

```
Padding (small) = 384 - Arrow's body lenght - Arrow's tip length - Padding (large) 
```